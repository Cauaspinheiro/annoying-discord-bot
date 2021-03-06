defmodule AnnoyingBot.Users.Read do
  alias AnnoyingBot.{User, Repo}

  def get_by_id(id) do
    Repo.get_by(User, %{id: id})
  end
end
