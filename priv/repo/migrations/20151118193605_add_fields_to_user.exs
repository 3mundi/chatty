defmodule Chatty.Repo.Migrations.AddFieldsToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :crypted_password, :string
    end
  end
end
