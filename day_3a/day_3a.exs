defmodule Day3a do
  def solve(data) do
    data = data |> String.trim |> String.to_integer

    data
    |> draw_spiral
    |> calculate_distance
  end

  defp draw_spiral(max_square, square \\ 1, prev_coords \\ {0, 0}, spiral_size \\ {0, 0, 0, 0}, direction \\ :right)
  defp draw_spiral(max_square, square, prev_coords, spiral_size, direction) when square == 1 and max_square > 1 do
    draw_spiral(max_square, square + 1, prev_coords, spiral_size, direction)
  end
  defp draw_spiral(max_square, square, prev_coords, spiral_size, direction) when square < max_square do
    new_coords = move(prev_coords, direction)
    {next_direction, spiral_size} = next_direction(new_coords, direction, spiral_size)
    draw_spiral(max_square, square + 1, new_coords, spiral_size, next_direction)
  end
  defp draw_spiral(max_square, square, prev_coords, _spiral_size, direction) when square == max_square and max_square > 1 do
    move(prev_coords, direction)
  end
  defp draw_spiral(max_square, square, prev_coords, _spiral_size, _direction) when square == max_square and max_square == 1 do
    prev_coords
  end

  defp move({x, y}, direction) do
    case direction do
      :right  -> {x + 1, y}
      :up     -> {x, y + 1}
      :left   -> {x - 1, y}
      :down   -> {x, y - 1}
    end
  end

  defp next_direction({x, y}, direction, spiral_size = {max_x, max_y, min_x, min_y}) do
    case direction do
      :right ->
        if x > max_x do
          {:up, {max_x + 1, max_y, min_x, min_y}}
        else
          {:right, spiral_size}
        end
      :up ->
        if y > max_y do
          {:left, {max_x, max_y + 1, min_x, min_y}}
        else
          {:up, spiral_size}
        end
      :left ->
        if x < min_x do
          {:down, {max_x, max_y, min_x - 1, min_y}}
        else
          {:left, spiral_size}
        end
      :down ->
        if y < min_y do
          {:right, {max_x, max_y, min_x, min_y - 1}}
        else
          {:down, spiral_size}
        end
    end
  end

  defp calculate_distance({x, y}) do
    abs(x) + abs(y)
  end
end

ExUnit.start()

defmodule Day3aTest do
  use ExUnit.Case

  test "for square 1" do
    assert Day3a.solve("1") == 0
  end

  test "for square 3" do
    assert Day3a.solve("3") == 2
  end

  test "for square 12" do
    assert Day3a.solve("12") == 3
  end

  test "for square 23" do
    assert Day3a.solve("23") == 2
  end

  test "for square 1024" do
    assert Day3a.solve("1024") == 31
  end
end

File.read!("day_3a.txt")
|> Day3a.solve
|> IO.inspect
