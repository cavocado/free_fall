defmodule FreeFallWeb.Live.Components.Title do
  use Surface.LiveComponent

  prop(message, :string, required: true)

  def mount(socket, message) do
    {:ok, assign(socket, message: message)}
  end

  def render(assigns) do
    ~F"""
    <h1>{@message}</h1>
    """
  end
end
