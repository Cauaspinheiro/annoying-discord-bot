defmodule AnnoyingBot.Users.Update do
  alias AnnoyingBot.{User, Repo}

  def update(%User{} = user) do
    Repo.update(user)
  end
end
