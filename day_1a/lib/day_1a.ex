defmodule Day1a do
  @moduledoc """
  Documentation for Day1a.
  """

  @doc """
  Solves the AoC challenge.

  ## Examples

      iex> Day1a.solve(SeedData.input_data)
      1031

  """
  def solve(data) do
    data = data |> SeedData.treat_data

    data
    |> Stream.with_index
    |> Enum.reduce(0, fn(x, acc) -> acc + compare_with_matching_element(data, x) end)
  end

  defp compare_with_matching_element(list, {element, index}) do
    if element == Enum.at(list, matching_index(length(list), index)), do: String.to_integer(element), else: 0
  end

  defp matching_index(size, index) when index < (size - 1), do: index + 1
  defp matching_index(size, index) when index == (size - 1), do: 0
end
