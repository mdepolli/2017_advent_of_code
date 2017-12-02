defmodule Day1b do
  @moduledoc """
  Documentation for Day1b.
  """

  @doc """
  Solves the AoC challenge.

  ## Examples

      iex> Day1b.solve(SeedData.input_data)
      1080

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

  defp matching_index(size, index) when index < round(size / 2), do: index + round(size / 2)
  defp matching_index(size, index) when index >= round(size / 2), do: index - round(size / 2)
end
