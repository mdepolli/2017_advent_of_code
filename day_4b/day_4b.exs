defmodule Day4b do
  def solve(data) do
    data
    |> treat_data()
    |> Stream.map(&String.split(&1))
    |> Stream.map(&sort_letters(&1))
    |> Stream.filter(&is_valid(&1))
    |> Enum.count
  end

  defp treat_data(str) do
    str |> String.trim |> String.split("\n")
  end

  defp sort_letters(list) do
    Enum.map(list, fn(x) ->
      x
      |> String.codepoints
      |> Enum.sort
      |> Enum.join
    end)
  end

  defp is_valid(list) do
    Enum.count(Enum.uniq(list)) == Enum.count(list)
  end
end

ExUnit.start()

defmodule Day4bTest do
  use ExUnit.Case

  test "for example 1" do
    assert Day4b.solve("abcde fghij") == 1
  end

  test "for example 2" do
    assert Day4b.solve("abcde xyz ecdab") == 0
  end

  test "for example 3" do
    assert Day4b.solve("a ab abc abd abf abj") == 1
  end

  test "for example 4" do
    assert Day4b.solve("iiii oiii ooii oooi oooo") == 1
  end

  test "for example 5" do
    assert Day4b.solve("oiii ioii iioi iiio") == 0
  end
end

File.read!("day_4b.txt")
|> Day4b.solve
|> IO.inspect
