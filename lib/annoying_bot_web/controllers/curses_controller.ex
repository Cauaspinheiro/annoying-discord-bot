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

  def all(conn, _params) do
    with {:ok, curses: curses}  <- AnnoyingBot.get_all_curses() do
      conn
      |> put_status(:ok)
      |> render("curses.json", curses: curses)
    end
  end

  def create(conn, params) do
    with {:ok, curse} <- AnnoyingBot.create_curse(params) do
      IO.inspect(curse)

      conn
      |> put_status(:created)
      |> render("create_curse.json", curse: curse)
    end
  end
end
