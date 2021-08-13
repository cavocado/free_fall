defmodule PointTest do
  use ExUnit.Case

  test "Tests a new Point" do
    # given
    new_point = Point.new(0, 0)

    assert {0, 0} == new_point
  end

  test "Tests Point moves to Left" do
    expected = {1, 2}

    calculated = Point.left({2, 2})

    assert expected == calculated
  end

  test "Tests Point moves to Right" do
    expected = {3, 2}

    calculated = Point.right({2, 2})

    assert expected == calculated
  end

  #    def down({x, y}), do: {x, y + 1}
  test "Tests Point moves to Down" do
    expected = {2, 3}

    calculated = Point.down({2, 2})

    assert expected == calculated
  end

  test "Tests Point rotates 90degrees" do
    point = Point.new(1, 1)
    expected = {4, 1}

    calculated = Point.rotate90(point)

    assert expected == calculated
  end

  test "Tests Point rotates 180degrees" do
    point = Point.new(4, 1)
    expected = {1, 4}

    calculated = Point.rotate180(point)

    assert expected == calculated
  end

  test "Tests Point rotates 270degrees" do
    point = Point.new(1, 4)
    expected = {4, 4}

    calculated = Point.rotate270(point)

    assert expected == calculated
  end
end
