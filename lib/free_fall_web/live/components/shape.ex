defmodule FreeFallWeb.Live.Components.Shape do
  use Surface.LiveComponent
  alias FreeFall.Game.Shape

  prop(tetro, :map, required: true)

  def mount(socket, %{position: position} = tetro) do
    {:ok, assign(socket, position: position, points: Shape.from_tetro(tetro))}
  end

  def render(assigns) do
    ~F"""
    {#for point <- @points}
      {inspect point}
    {/for}
    """
  end
end
