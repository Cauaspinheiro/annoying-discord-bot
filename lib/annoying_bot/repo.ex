defmodule AnnoyingBot.Repo do
  use Ecto.Repo,
    otp_app: :annoying_bot,
    adapter: Ecto.Adapters.Postgres
end
