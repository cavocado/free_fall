defmodule FreeFallWeb.GameLive do
  # use FreeFallWeb, :live_view
  use Surface.LiveView
  alias FreeFall.Game.{Tetro, Board}
  alias FreeFall.Game
  alias FreeFallWeb.Live.Components.{Title, Button, Shape}

  @impl true
  def render(assigns) do
    ~F"""
    <Title message={@title} id="title" />
    <pre>
    { inspect @board }
    </pre>

    <Button action="left" label="Left" id="left-button" />
    <Button action="right" label="Right" id="right-button" />
    <Button action="rotate" label="Rotate" id="rotate-button" />


    <svg viewBox="0 0 200 220" xmlns="http://www.w3.org/2000/svg"  style="background-color:black;max-width:200px;">
    <Shape points={Game.Shape.from_tetro(@board.tetro)} id="hola"/>
    <Shape points={@board.graveyard} id="hallo"/>
    </svg>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    :timer.send_interval(:timer.seconds(1), self(), :down)
    {:ok, assign(socket, board: Board.new(Tetro.new_random()), title: "Welcome to FreeFall!")}
  end

  @impl true
  def handle_event("left", _value, %{assigns: %{board: board}} = socket) do
    {:noreply, assign(socket, board: Board.maybe_move_left(board))}
  end

  @impl true
  def handle_event("right", _value, %{assigns: %{board: board}} = socket) do
    {:noreply, assign(socket, board: Board.maybe_move_right(board))}
  end

  @impl true
  def handle_event("rotate", _value, %{assigns: %{board: board}} = socket) do
    {:noreply, assign(socket, board: Board.rotate(board))}
  end

  @impl true
  def handle_info(:down, %{assigns: %{board: board}} = socket) do
    {:noreply, assign(socket, board: Board.maybe_move_down(board))}
  end
end
