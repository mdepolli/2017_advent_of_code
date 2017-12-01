defmodule Day1aTest do
  use ExUnit.Case
  doctest Day1a

  test "for the first example" do
    assert Day1a.solve("1122") == 3
  end

  test "for the second example" do
    assert Day1a.solve("1111") == 4
  end

  test "for the third example" do
    assert Day1a.solve("1234") == 0
  end

  test "for the fourth example" do
    assert Day1a.solve("91212129") == 9
  end
end
