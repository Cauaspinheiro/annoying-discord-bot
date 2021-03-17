defmodule AnnoyingBot.Repo.Migrations.AddCursesCreatedBy do
  use Ecto.Migration

   def change do
    alter table :curses do
      add :created_by, :string
    end
  end
end
