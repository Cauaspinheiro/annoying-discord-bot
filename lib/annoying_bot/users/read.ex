defmodule AnnoyingBot.Users.Read do
  alias AnnoyingBot.{User, Repo}

  def get_by_id(id) do
    {:ok, user: Repo.get_by(User, %{id: id})}
  end

  def all do
    {:ok, users: Repo.all(User)}
  end
end
