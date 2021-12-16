defmodule FreeFall.Game.Tetro do
  defstruct shape: :l, position: {5, 1}, rotation: 0

  @shapes [:l, :o, :j, :t, :s, :z, :i]

  alias FreeFall.Game.Point

  def new do
    %__MODULE__{}
  end

  def new(shape) do
    %__MODULE__{shape: shape}
  end

  def new_random do
    %__MODULE__{shape: Enum.random(@shapes)}
  end

  def down(tetro) do
    %{tetro | position: Point.down(tetro.position)}
  end

  def left(tetro) do
    %{tetro | position: Point.left(tetro.position)}
  end

  def right(tetro) do
    %{tetro | position: Point.right(tetro.position)}
  end

  def convert(tetro) do
    {tetro.shape, tetro.rotation, tetro.position}
  end

  def rotate(tetro) do
    %{tetro | rotation: rem(tetro.rotation + 90, 360)}
  end
end

defimpl Inspect, for: Tetro do
  alias FreeFall.Game.Shape

  def inspect(tetro, _opts) do
    tetro
    |> Map.get(:shape)
    |> Shape.new()
    |> Shape.to_string()
  end
end
