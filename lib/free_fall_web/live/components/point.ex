defmodule FreeFallWeb.Live.Components.Point do
  use Surface.LiveComponent

  prop(color, :string, required: true)
  prop(x, :integer, required: true)
  prop(y, :integer, required: true)

  def mount(socket, x, y, color) do
    {:ok, assign(socket, x: x, y: y, color: color)}
  end

  def render(assigns) do
    ~F"""
    <rect id="square" x={@x * 10} y={@y * 10} width="10" height="10" fill={@color} />
    """
  end
end
