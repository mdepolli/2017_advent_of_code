defmodule Day1bTest do
  use ExUnit.Case
  doctest Day1b

  test "for the first example" do
    assert Day1b.solve("1212") == 6
  end

  test "for the second example" do
    assert Day1b.solve("1221") == 0
  end

  test "for the third example" do
    assert Day1b.solve("123425") == 4
  end

  test "for the fourth example" do
    assert Day1b.solve("123123") == 12
  end

  test "for the fifth example" do
    assert Day1b.solve("12131415") == 4
  end
end
