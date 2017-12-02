defmodule Day2b do
  @moduledoc """
  Documentation for Day2b.
  """

  @doc """
  Solves the AoC challenge.

  ## Examples

      iex> Day2b.solve(SeedData.input_data)
      308

  """
  def solve(data) do
    data
    |> SeedData.treat_data
    |> Stream.map(&process_line(&1))
    |> Enum.sum
  end

  defp process_line(list) do
    Enum.reduce(list, 0, fn(x, acc) -> acc + check_rem(x, list -- [x]) end)
  end

  defp check_rem(element, list) do
    Enum.reduce(list, 0, fn(x, acc) -> if rem(element, x) == 0, do: acc + round(element / x), else: acc end)
  end
end
