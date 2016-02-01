defmodule Chatty.RoomChannel do
  use Phoenix.Channel
  alias Chatty.User
  alias Chatty.Repo
  require IEx

  def join("rooms:lobby", _message, socket) do
    IO.puts "JOINED"
    if socket.assigns.user_id do
      {:ok, socket}
    else
      {:error, socket, :unauthorized}
    end
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    IO.puts body
    broadcast! socket, "new_msg", %{body: body, user: current_user(socket).name}
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end

  defp current_user(socket) do
    Repo.get!(User, socket.assigns.user_id)
  end
end
