defmodule AnnoyingBotWeb.UsersController do
  use AnnoyingBotWeb, :controller

  alias AnnoyingBot.User

  action_fallback AnnoyingBotWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- AnnoyingBot.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create_user.json", user: user)
    end
  end
end
