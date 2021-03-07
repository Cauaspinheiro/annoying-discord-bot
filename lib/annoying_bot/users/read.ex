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
end
