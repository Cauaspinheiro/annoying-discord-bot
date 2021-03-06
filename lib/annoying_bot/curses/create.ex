defmodule AnnoyingBot.Curses.Create do
  alias AnnoyingBot.{Curse, Repo}

  def call(params) do
    params
    |> Curse.changeset()
    |> Repo.insert()
  end
end
