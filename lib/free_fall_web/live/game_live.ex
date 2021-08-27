defmodule FreeFallWeb.GameLive do
  use FreeFallWeb, :live_view

  @impl true
  def render(assigns) do
    ~L"""
    <%=@hello%>
    <canvas id="Canvas" width=400 height=400 style="border:2px solid"></canvas>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, hello: :world)}
  end
end
