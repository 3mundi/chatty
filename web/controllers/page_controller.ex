defmodule Chatty.PageController do
  use Chatty.Web, :controller

  def index(conn, _params) do
    # text conn, "HELLO"
    render conn, "index.html"
  end

  def chat(conn, _params) do
    render conn, "chat.html"
  end
end
