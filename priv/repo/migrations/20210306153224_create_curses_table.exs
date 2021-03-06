defmodule AnnoyingBot.Repo.Migrations.CreateCursesTable do
  use Ecto.Migration

  def change do
    create table :curses do
      add :phrase, :string

      timestamps()
    end
  end
end
