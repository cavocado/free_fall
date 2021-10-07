defmodule FreeFall.Game.Shape do
  alias FreeFall.Game.Point

  def from_tetro(tetro) do
    new(tetro.shape)
    |> rotate(tetro.rotation)

    # |> move(tetro.position)
  end

  def new(:o) do
    [{2, 2}, {3, 2}, {2, 3}, {3, 3}]
  end

  def new(:i) do
    [{2, 1}, {2, 2}, {2, 3}, {2, 4}]
  end

  def new(:t) do
    [{2, 2}, {3, 2}, {4, 2}, {3, 3}]
  end

  def new(:z) do
    [{2, 2}, {3, 2}, {3, 3}, {4, 3}]
  end

  def new(:s) do
    [{2, 2}, {3, 2}, {1, 3}, {2, 3}]
  end

  def new(:l) do
    [{2, 1}, {2, 2}, {2, 3}, {3, 3}]
  end

  def new(:j) do
    [{3, 1}, {3, 2}, {2, 3}, {3, 3}]
  end

  defp rotate(shape, rotation) do
    Enum.map(shape, fn point -> Point.rotate(point, rotation) end)
  end

  defp move(shape, {x, y} = _position) do
    Enum.map(shape, fn {a, b} -> {a + x - 1, b + y - 1} end)
  end

  def to_string(points) do
    list = for y <- 1..4, x <- 1..4, do: to_character({x, y}, points)
    List.to_string(list)
  end

  defp to_character({x, _y} = point, points) do
    in_list = !!Enum.find_value(points, fn x -> x == point end)

    cond do
      in_list and x == 4 -> "*\n"
      in_list -> "* "
      x == 4 -> " \n"
      true -> "  "
    end
  end
end
