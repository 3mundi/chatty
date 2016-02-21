defmodule Chatty.Plugs.Auth do
  import Plug.Conn
  alias Chatty.Session
  def init(default), do: default
  def call(conn, _default) do
    authenticate(conn)
  end

  defp authenticate(conn) do
    case get_user_from_session(conn) do
      { :ok, user } ->
        assign(conn, :current_user, user)
      _ ->
        conn |> Phoenix.Controller.put_flash(:info, "You must be logged in") |> Phoenix.Controller.redirect(to: "/") |> halt
    end
  end

  defp get_user_from_session(conn) do
    id = get_session(conn, :current_user)
    if id, do: { :ok, Chatty.Repo.get(Chatty.User, id) }, else: :not_authenticated
  end

  def current_user(conn) do
    conn.assigns[:current_user]
  end
end
