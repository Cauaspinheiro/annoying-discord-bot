defmodule AnnoyingBotWeb.UsersController do
  use AnnoyingBotWeb, :controller

  alias AnnoyingBot.User

  action_fallback AnnoyingBotWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- AnnoyingBot.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create_user.json", data: user)
    end
  end

  def all(conn, _params) do
    with {:ok, [users: users]} <- AnnoyingBot.get_all_users() do
      conn
      |> put_status(:ok)
      |> render("users.json", users: users)
    end
  end
end
