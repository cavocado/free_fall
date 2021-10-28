defmodule FreeFallWeb.Live.Components.Shape do
  use Surface.LiveComponent
  alias FreeFallWeb.Live.Components.Point

  prop(points, :list, required: true)

  def update(assigns, socket) do
    {:ok, assign(socket, points: assigns.points)}
  end

  def render(assigns) do
    ~F"""
    {#for {x, y} <- @points}
    <Point x={x} y={y} color="blue" id={"#{x}#{y}"} />
    {/for}
    """
  end
end
