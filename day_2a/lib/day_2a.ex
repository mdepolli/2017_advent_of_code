defmodule Day2a do
  @moduledoc """
  Documentation for Day2a.
  """

  @doc """
  Solves the AoC challenge.

  ## Examples

      iex> Day2a.solve(SeedData.input_data)
      58975

  """
  def solve(data) do
    data
    |> SeedData.treat_data
    |> Stream.map(&Enum.min_max(&1))
    |> Enum.reduce(0, fn({min, max}, acc) -> acc + max - min end)
  end
end
