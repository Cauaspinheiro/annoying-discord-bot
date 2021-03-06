defmodule AnnoyingBot.Users.Create do
  alias AnnoyingBot.Repo
  alias AnnoyingBot.User


  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> IO.inspect()
  end
end
