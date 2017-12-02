defmodule Day1a do
  @moduledoc """
  Documentation for Day1a.
  """

  @doc """
  Solves the AoC challenge.

  ## Examples

      iex> Day1a.solve(SeedData.data)
      1031

  """
  def solve(data) do
    data = data |> treat_data

    data
    |> Stream.with_index
    |> Stream.filter(fn({ele, index}) -> ele == Enum.at(data, matching_index(length(data), index)) end)
    |> Stream.map(fn({ele, _}) -> String.to_integer(ele) end)
    |> Enum.sum
  end

  defp treat_data(str) do
    str
    |> String.trim
    |> String.split("", trim: true)
  end

  defp matching_index(size, index) when index < (size - 1), do: index + 1

  defp matching_index(size, index) when index == (size - 1), do: 0
end
