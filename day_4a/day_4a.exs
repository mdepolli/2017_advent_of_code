defmodule Day4a do
  def solve(data) do
    data = data |> String.trim |> String.split("\n")

    data
    |> Stream.map(&String.split(&1))
    |> Stream.filter(&is_valid(&1))
    |> Enum.count
  end

  defp is_valid(list) do
    Enum.count(Enum.uniq(list)) == Enum.count(list)
  end
end

ExUnit.start()

defmodule Day4aTest do
  use ExUnit.Case

  test "for example 1" do
    assert Day4a.solve("aa bb cc dd ee") == 1
  end

  test "for example 2" do
    assert Day4a.solve("aa bb cc dd aa") == 0
  end

  test "for example 3" do
    assert Day4a.solve("aa bb cc dd aaa") == 1
  end

  test "for all given examples" do
    assert Day4a.solve("aa bb cc dd ee\naa bb cc dd aa\naa bb cc dd aaa\n") == 2
  end
end

File.read!("day_4a.txt")
|> Day4a.solve
|> IO.inspect
