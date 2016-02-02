# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Chatty.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
collection = [
  %{name: "Artur", email: "artur@example.com", password: "secret"},
  %{name: "Juan", email: "juan@example.com", password: "secret"}
]
Enum.each collection, fn(u) ->
  changeset = Chatty.User.changeset(%Chatty.User{}, u)
  Chatty.Registration.create(changeset, Chatty.Repo)
end
