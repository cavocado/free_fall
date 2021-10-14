defmodule FreeFallWeb.Live.Components.Shape do
  use Surface.LiveComponent
  alias FreeFall.Game.Shape
  alias FreeFallWeb.Live.Components.Point

  prop(tetro, :map, required: true)
  prop(points, :list, required: false)
  prop(position, :tuple, required: false)
  data(point, :tuple)

  def mount(socket, %{position: position} = tetro) do
    {:ok, assign(socket, position: position, points: Shape.from_tetro(tetro))}
  end

  def render(assigns) do
    ~F"""
    <div>
    inspect {#for point <- @points} {point} {/for}
    </div>
    """
  end
end

# <Point {#for point <- @points}
#      point="{{point}}"
#    {/for}
#    color="red"
#    id="hi"
#    />
