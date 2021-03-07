defmodule AnnoyingBot.Repo.Migrations.CreateCursesTable do
  use Ecto.Migration

  def change do
    create table :curses do
      add :phrase, :string
      add :type, :string

      timestamps()
    end

    create unique_index(:curses, [:phrase])
  end
end
