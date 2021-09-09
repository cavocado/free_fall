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

    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, tetro: Tetro.new(:j))}
  end
end
