defmodule AnnoyingBotWeb.WelcomeController do
  use AnnoyingBotWeb, :controller

  def welcome(conn, _params) do
    conn
    |> json(%{message: "hello world from annoying bot", fuck: "you"})
  end
end
