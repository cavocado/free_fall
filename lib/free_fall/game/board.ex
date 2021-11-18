defmodule FreeFall.Game.Board do
  @right_boundary 10
  @left_boundary 1
  @bottom_boundary 20

  alias FreeFall.Game.{Shape, Tetro}

  defstruct graveyard: [],
            tetro: %{},
            score: 0

  def new() do
    %__MODULE__{}
  end

  def new(tetro) do
    %__MODULE__{tetro: tetro}
  end

  def maybe_move_left(%{tetro: tetro} = board) do
    points = Shape.from_tetro(tetro)

    case is_valid_left?(points) do
      true -> %{board | tetro: Tetro.left(tetro)}
      false -> board
    end
  end

  defp is_valid_left?(points) do
    Enum.any?(points, fn {x, _y, _color} -> x > @left_boundary end)
  end

  def maybe_move_right(%{tetro: tetro} = board) do
    points = Shape.from_tetro(tetro)

    case is_valid_right?(points) do
      true -> %{board | tetro: Tetro.right(tetro)}
      false -> board
    end
  end

  defp is_valid_right?(points) do
    Enum.any?(points, fn {x, _y, _color} -> x < @right_boundary - 1 end)
  end

  def maybe_move_down(%{tetro: tetro} = board) do
    points = Shape.from_tetro(tetro)

    case is_valid_down?(points) do
      true -> %{board | tetro: Tetro.down(tetro)}
      false -> move_to_graveyard(board)
    end
  end

  defp is_valid_down?(points) do
    Enum.any?(points, fn {_x, y, _color} -> y < @bottom_boundary - 1 end)
  end

  def rotate(%{tetro: tetro} = board) do
    %{board | tetro: Tetro.rotate(tetro)}
  end

  def move_to_graveyard(%{tetro: old_tetro, graveyard: graveyard, score: score} = board) do
    %{
      board
      | tetro: Tetro.new(),
        graveyard: graveyard ++ Shape.from_tetro(old_tetro),
        score: score + 1
    }
  end
end
