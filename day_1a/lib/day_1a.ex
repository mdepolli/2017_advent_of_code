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

  defp to_tuples(data, index) when index < (length(data) - 1) do
    {Enum.at(data, index), Enum.at(data, index + 1)}
  end

  defp to_tuples(data, index) when index == (length(data) - 1) do
    {Enum.at(data, index), Enum.at(data, 0)}
  end
end
