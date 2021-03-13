defmodule AnnoyingBotWeb.DiscordController do
  use AnnoyingBotWeb, :controller

 def start(conn, _params) do
   AnnoyingBot.start_bot
   conn
   |> put_status(204)
   |> json(%{})
 end
end
