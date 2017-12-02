defmodule Day1b do
  @moduledoc """
  Documentation for Day1b.
  """

  @doc """
  Solves the AoC challenge.

  ## Examples

      iex> Day1b.solve(SeedData.data)
      1080

  """
  def solve(data) do
    data = data |> treat_data

    0..(length(data) - 1)
    |> Enum.map(&to_tuples(data, &1))
    |> Enum.filter(fn(ele) -> match?({a, a}, ele) end)
    |> Enum.reduce(0, fn({ele, ele}, acc) -> String.to_integer(ele) + acc end)
  end

  defp treat_data(str) do
    str
    |> String.trim
    |> String.split("", trim: true)
  end

  defp to_tuples(data, index) do
    {Enum.at(data, index), Enum.at(data, matching_index(length(data), index))}
  end

  defp matching_index(size, index) when index < round(size / 2) do
    index + round(size / 2)
  end

  defp matching_index(size, index) when index >= round(size / 2) do
    index - round(size / 2)
  end
end
