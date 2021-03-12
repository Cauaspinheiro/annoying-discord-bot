defmodule AnnoyingBot.Repo.Migrations.AddUsersCreatedBy do
  use Ecto.Migration

  def change do
    alter table :users do
      add :created_by, :string
    end
  end
end
