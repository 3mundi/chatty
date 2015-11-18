defmodule Chatty.RegistrationController do
  use Chatty.Web, :controller
  alias Chatty.User

  def new(conn, params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end
  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Chatty.Registration.create(changeset, Chatty.Repo) do
      {:ok, changeset} ->
        conn
        |> put_session(:current_user, changeset.id)
        |> put_flash(:info, "Lo que te salga del pito")
        |> redirect(to: "/")
        # sign in the user
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Tu vieja grita al verme")
        |> render("new.html", changeset: changeset)
        # show error message
    end
  end
end
