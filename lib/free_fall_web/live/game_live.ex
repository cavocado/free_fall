defmodule FreeFallWeb.GameLive do
  use FreeFallWeb, :live_view
  alias FreeFall.Game.Tetro

  @impl true
  def render(assigns) do
    ~L"""

    <pre>
    <%= inspect @tetro %>
    </pre>

    <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
    <rect id="square" x="100" width="10" height="10" fill="red" />
    <rect id="square" x="100" y="10" width="10" height="10" fill="red" />
    <rect id="square" x="100" y="20" width="10" height="10" fill="red" />
    <rect id="square" x="90" y="20" width="10" height="10" fill="red" />
    </svg>
    <button phx-click="left">Left</button>
    <button phx-click="rotate">Rotate</button>
    <button phx-click="right">Right</button>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, tetro: Tetro.new(:j))}
  end

  @impl true
  def handle_event("left", _value, socket) do
    # pattern match on socket to get tetro
    %{assigns: %{tetro: tetro}} = socket
    {:noreply, assign(socket, tetro: Tetro.left(tetro))}
  end
end
