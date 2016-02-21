defmodule Chatty.RoomTest do
  use Chatty.ModelCase

  alias Chatty.Room

  @valid_attrs %{name: "some content", user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Room.changeset(%Room{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Room.changeset(%Room{}, @invalid_attrs)
    refute changeset.valid?
  end
end
