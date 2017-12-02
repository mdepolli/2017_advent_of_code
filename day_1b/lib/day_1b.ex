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

  defp matching_index(size, index) when index < round(size / 2), do: index + round(size / 2)

  defp matching_index(size, index) when index >= round(size / 2), do: index - round(size / 2)
end
