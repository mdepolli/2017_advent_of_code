defmodule Day2aTest do
  use ExUnit.Case
  doctest Day2a

  test "with the given example" do
    data = """
    5 1 9 5
    7 5 3
    2 4 6 8
    """

    assert Day2a.solve(data) == 18
  end
end
