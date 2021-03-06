defmodule AnnoyingBotWeb.CursesController do
  use AnnoyingBotWeb, :controller

  action_fallback AnnoyingBotWeb.FallbackController

  def curse_user(conn, params) do
    with {:ok, message} <- AnnoyingBot.curse_user(params) do
      conn
      |> put_status(:ok)
      |> render("curse_user.json", message: message)
    end
  end
end
