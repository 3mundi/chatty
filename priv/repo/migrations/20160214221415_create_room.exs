defmodule Chatty.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :user_id, :integer

      timestamps
    end

  end
end
