defmodule WaitingRoomWeb.PageController do
  use WaitingRoomWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
