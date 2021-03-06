defmodule AnnoyingBotWeb.FallbackController do
  use AnnoyingBotWeb, :controller
  alias AnnoyingBotWeb.ErrorView

  def call(conn, {:error, result}, status \\ :bad_request) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("400.json", result: result)
  end
end
