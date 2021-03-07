defmodule AnnoyingBot.Curses.Read do
  alias AnnoyingBot.{Repo, Curse}
  import Ecto.Query

  def all do
    curses = Repo.all(Curse)

    {:ok, curses: curses}
  end

  def get_random_curse(type \\ "general") do
    Curse
    |> where([c], c.type == ^type)
    |> Repo.all()
    |> get_random_index()
  end

  defp get_random_index(list) do
    max_index = length(list) - 1
    random_index = Enum.random(0..max_index)

    {:ok, curse: Enum.at(list, random_index)}
  end
end
