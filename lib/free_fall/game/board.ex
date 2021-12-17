defmodule FreeFall.Game.Board do
  @right_boundary 20
  @left_boundary 0
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

  def maybe_move_left(%{tetro: tetro, graveyard: graveyard} = board) do
    new_points =
      tetro
      |> Tetro.left()
      |> Shape.from_tetro()

    case is_valid_left?(new_points, graveyard) do
      true -> %{board | tetro: Tetro.left(tetro)}
      false -> board
    end
  end

  defp is_valid_left?(points, graveyard) do
    Enum.all?(points, fn {x, _y, _color} -> x > @left_boundary - 1 end) and
      !is_in_graveyard?(points, graveyard)
  end

  def maybe_move_right(%{tetro: tetro, graveyard: graveyard} = board) do
    new_points =
      tetro
      |> Tetro.right()
      |> Shape.from_tetro()

    case is_valid_right?(new_points, graveyard) do
      true -> %{board | tetro: Tetro.right(tetro)}
      false -> board
    end
  end

  defp is_valid_right?(points, graveyard) do
    Enum.all?(points, fn {x, _y, _color} -> x < @right_boundary end) and
      !is_in_graveyard?(points, graveyard)
  end

  def maybe_move_down(%{tetro: tetro, graveyard: graveyard} = board) do
    new_points =
      tetro
      |> Tetro.down()
      |> Shape.from_tetro()

    case is_valid_down?(new_points, graveyard) do
      true -> %{board | tetro: Tetro.down(tetro)}
      false -> move_to_graveyard(board)
    end
  end

  defp is_valid_down?(points, graveyard) do
    Enum.all?(points, fn {_x, y, _color} -> y < @bottom_boundary end) and
      !is_in_graveyard?(points, graveyard)
  end

  defp is_in_graveyard?(points, graveyard) do
    # one enum = map to 2 tuple
    new_graveyard = Enum.map(graveyard, fn {x, y, _color} -> {x, y} end)
    # enum over the points and check in new graveyard
    Enum.any?(points, fn {x, y, _color} -> Enum.member?(new_graveyard, {x, y}) end)
  end

  def rotate(%{tetro: tetro} = board) do
    %{board | tetro: Tetro.rotate(tetro)}
  end

  def move_to_graveyard(%{tetro: old_tetro, graveyard: graveyard, score: score} = board) do
    %{
      board
      | tetro: Tetro.new_random(),
        graveyard: graveyard ++ Shape.from_tetro(old_tetro),
        score: score + 1
    }
  end
end
