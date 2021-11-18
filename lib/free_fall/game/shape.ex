defmodule FreeFall.Game.Shape do
  alias FreeFall.Game.Point

  def from_tetro(tetro) do
    new(tetro.shape)
    |> rotate(tetro.rotation)
    |> move(tetro.position)
  end

  def new(:o) do
    [{2, 2,"red"}, {3, 2, "red"}, {2, 3, "red"}, {3, 3, "red"}]
  end

  def new(:i) do
    [{2, 1, "blue"}, {2, 2, "blue"}, {2, 3, "blue"}, {2, 4, "blue"}]
  end

  def new(:t) do
    [{2, 2, "green"}, {3, 2, "green"}, {4, 2, "green"}, {3, 3, "green"}]
  end

  def new(:z) do
    [{2, 2, "yellow"}, {3, 2, "yellow"}, {3, 3, "yellow"}, {4, 3, "yellow"}]
  end

  def new(:s) do
    [{2, 2, "orange"}, {3, 2, "orange"}, {1, 3, "orange"}, {2, 3, "orange"}]
  end

  def new(:l) do
    [{2, 1, "white"}, {2, 2, "white"}, {2, 3, "white"}, {3, 3, "white"}]
  end

  def new(:j) do
    [{3, 1, "pink"}, {3, 2, "pink"}, {2, 3, "pink"}, {3, 3, "pink"}]
  end

  defp rotate(shape, rotation) do
    Enum.map(shape, fn point -> Point.rotate(point, rotation) end)
  end

  defp move(shape, {x, y} = _position) do
    Enum.map(shape, fn {a, b, c} -> {a + x - 1, b + y - 1, c} end)
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
