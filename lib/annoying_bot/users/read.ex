defmodule AnnoyingBot.Users.Read do
  alias AnnoyingBot.{User, Repo}

  def get_by_id(id) do
    case Repo.get_by(User, %{id: id}) do
      %User{} = user -> {:ok, user: user}
      nil -> {:error, "USER NOT FOUND"}
    end
  end

  def all do
    {:ok, users: Repo.all(User)}
  end

  def get_by_discord(discord) do
    case Repo.get_by(User, %{discord_id: discord}) do
      %User{} = user -> {:ok, user: user}
      nil -> {:error, "USER NOT FOUND"}
    end
  end

  def get_by_name(name) do
    case Repo.get_by(User, %{name: name}) do
      %User{} = user -> {:ok, user: user}
      nil -> {:error, "USER NOT FOUND"}
    end
  end
end
