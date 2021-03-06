defmodule AnnoyingBot.Users.Create do
  alias AnnoyingBot.{Repo, User}


  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
