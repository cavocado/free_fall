defmodule FreeFallWeb.Live.Components.Point do
  use Surface.LiveComponent

  prop(color, :string, required: true)
  prop(point, :tuple, required: true)

  def mount(socket, {x, y}, color) do
    {:ok, assign(socket, x: 10 * x, y: 10 * y, color: color)}
  end

  def render(assigns) do
    ~F"""
    <rect id="square" x="{@x}" y="{@y}" width="10" height="10" fill="@color" />
    """
  end
end
