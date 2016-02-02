defmodule Chatty.PageController do
  use Chatty.Web, :controller
  import Chatty.Session, only: [current_user: 1]

  def index(conn, _params) do
    render conn, "index.html"
  end

  def chat(conn, _params) do
    if current_user(conn) do
      render conn, "chat.html"
    else
      conn
      |> put_flash(:info, "You must be logged in to continue.")
      |> redirect(to: "/login")
    end
  end
end
