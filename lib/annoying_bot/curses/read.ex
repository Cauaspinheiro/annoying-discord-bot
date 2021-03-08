defmodule AnnoyingBot.Curses.Read do
  alias AnnoyingBot.{Repo, Curse}
  import Ecto.Query

  def all do
    curses = Repo.all(Curse)

    {:ok, curses: curses}
  end

  def get_random_curse(type) do
    with :ok <- Curse.validate_type(type) do
      Curse
      |> where([c], c.type == ^type)
      |> Repo.all()
      |> return_random_or_error()
    end
  end

  defp return_random_or_error(curses) do
    case curses do
      nil -> {:error, "CURSES NOT FOUND"}
      [] -> {:error, "CURSES NOT FOUND"}
      _ -> get_random_index(curses)
    end
  end

  defp get_random_index(curses) do
    max_index = length(curses) - 1
    random_index = Enum.random(0..max_index)

    {:ok, curse: Enum.at(curses, random_index)}
  end
end
