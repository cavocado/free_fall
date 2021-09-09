defmodule FreeFall.Game.Point do
  def new(x, y), do: {x, y}

  def left({x, y}), do: {x - 1, y}

  def right({x, y}), do: {x + 1, y}

  def down({x, y}), do: {x, y + 1}

  defp flip({x, y}), do: {x, 5 - y}

  defp flop({x, y}), do: {5 - x, y}

  def rotate(point, 0), do: point
  def rotate(point, 90), do: point |> transpose |> flop
  def rotate(point, 180), do: point |> flip |> flop
  def rotate(point, 270), do: point |> transpose |> flip

  defp transpose({x, y}), do: {y, x}
end
