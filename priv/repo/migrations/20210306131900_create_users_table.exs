defmodule AnnoyingBot.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string
      add :discord_id, :string
      timestamps()
    end

    create unique_index(:users, [:discord_id])
  end
end
