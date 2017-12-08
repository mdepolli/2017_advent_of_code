defmodule Day3b do
  def solve(data) do
    data = data |> String.trim |> String.to_integer

    data
    |> draw_spiral
  end

  # All coordinates are {x, y, value}
  defp draw_spiral(max_square, square \\ 1, list \\ [{0, 0, 1}], direction_and_size \\ {:right, {0, 0, 0, 0}})
  defp draw_spiral(max_square, square, list, direction_and_size) when square == 1 and max_square > 1 do
    draw_spiral(max_square, square + 1, list, direction_and_size)
  end
  defp draw_spiral(max_square, square, list = [{x, y, _} | _], direction_and_size) do
    {new_x, new_y} = move({x, y}, direction_and_size)
    new_direction_and_size = new_direction_and_size({new_x, new_y}, direction_and_size)
    new_value = new_value({new_x, new_y}, list)

    if new_value > max_square do
      new_value
    else
      draw_spiral(max_square, square + 1, [{new_x, new_y, new_value} | list], new_direction_and_size)
    end
  end

  defp move({x, y}, {direction, _}) do
    case direction do
      :right  -> {x + 1, y}
      :up     -> {x, y + 1}
      :left   -> {x - 1, y}
      :down   -> {x, y - 1}
    end
  end

  defp new_direction_and_size({x, _}, {direction, {max_x, max_y, min_x, min_y}}) when direction == :right and x > max_x do
    {:up, {max_x + 1, max_y, min_x, min_y}}
  end
  defp new_direction_and_size({_, y}, {direction, {max_x, max_y, min_x, min_y}}) when direction == :up and y > max_y do
    {:left, {max_x, max_y + 1, min_x, min_y}}
  end
  defp new_direction_and_size({x, _}, {direction, {max_x, max_y, min_x, min_y}}) when direction == :left and x < min_x do
    {:down, {max_x, max_y, min_x - 1, min_y}}
  end
  defp new_direction_and_size({_, y}, {direction, {max_x, max_y, min_x, min_y}}) when direction == :down and y < min_y do
    {:right, {max_x, max_y, min_x, min_y - 1}}
  end
  defp new_direction_and_size(_, direction_and_size) do
    direction_and_size
  end

  defp new_value({x, y}, list) do
    (for i <- [0, 1, -1], j <- [0, 1, -1], do: {i, j})
    |> List.delete({0, 0})
    |> Enum.map(fn({i, j}) -> {x + i, y + j} end)
    |> Enum.reduce(0, fn(x, acc) -> acc + get_value_from_list(list, x) end)
  end

  defp get_value_from_list(list, {x, y}) do
    case Enum.find(list, fn({a, b, _}) -> {a, b} == {x, y} end) do
      nil -> 0
      {_, _, value} -> value
    end
  end
end

ExUnit.start()

defmodule Day3bTest do
  use ExUnit.Case

  test "for square 1" do
    assert Day3b.solve("1") == 2
  end

  test "for square 2" do
    assert Day3b.solve("2") == 4
  end

  test "for square 3" do
    assert Day3b.solve("3") == 4
  end

  test "for square 4" do
    assert Day3b.solve("4") == 5
  end

  test "for square 5" do
    assert Day3b.solve("5") == 10
  end

  test "for square 12" do
    assert Day3b.solve("12") == 23
  end
end

File.read!("day_3b.txt")
|> Day3b.solve
|> IO.inspect
