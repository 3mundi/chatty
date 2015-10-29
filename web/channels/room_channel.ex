defmodule Chatty.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    IO.puts "JOINED"
    {:ok, socket}
    # {:error, socket, :unauthorized}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
