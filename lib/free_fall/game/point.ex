defmodule FreeFall.Game.Point do
  def new(x, y, color), do: {x, y, color}

  def left({x, y}), do: {x - 1, y}

  def right({x, y}), do: {x + 1, y}

  def down({x, y}), do: {x, y + 1}

  defp flip({x, y, c}), do: {x, 5 - y, c}

  defp flop({x, y, c}), do: {5 - x, y, c}

  def rotate(point, 0), do: point
  def rotate(point, 90), do: point |> transpose |> flop
  def rotate(point, 180), do: point |> flip |> flop
  def rotate(point, 270), do: point |> transpose |> flip

  defp transpose({x, y, c}), do: {y, x, c}
end
