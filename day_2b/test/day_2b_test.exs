defmodule Day2bTest do
  use ExUnit.Case
  doctest Day2b

  test "with the given example" do
    data = """
    5 9 2 8
    9 4 7 3
    3 8 6 5
    """

    assert Day2b.solve(data) == 9
  end
end
