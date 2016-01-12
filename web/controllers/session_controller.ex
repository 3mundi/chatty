defmodule Chatty.SessionController do
 use Chatty.Web, :controller

 def new(conn, _params) do
   render conn, "new.html"
 end

 def create(conn, %{"session" => session_params}) do
   case Chatty.Session.login(session_params, Chatty.Repo) do
     {:ok, user} ->
       conn
       |> put_session(:current_user, user.id)
       |> put_flash(:info, "Logged in")
       |> redirect(to: "/")
     :error ->
       conn
       |> put_flash(:info, "Wrong email or password")
       |> render("new.html")
   end
 end

 def delete(conn, _) do
   Conn
   |> delete_session(:current_user)
   |> put_flash(:info, "Te pires mierda")
   |> redirect(to: "/")
 end
end
