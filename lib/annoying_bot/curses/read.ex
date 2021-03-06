defmodule AnnoyingBot.Curses.Read do
  alias AnnoyingBot.{Repo, Curse}

  def all do
    curses = Repo.all(Curse)

    {:ok, curses: curses}
  end

  def get_random_curse() do
    Repo.all(Curse)
    |> get_random_index()
  end

  defp get_random_index(list) do
    max_index = length(list) - 1
    random_index = Enum.random(0..max_index)

    Enum.at(list, random_index)
  end
end
