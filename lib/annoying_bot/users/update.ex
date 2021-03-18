defmodule AnnoyingBot.Users.Update do
  alias AnnoyingBot.{User, Repo}

  def update(user) do
    Repo.update(user)
  end
end
