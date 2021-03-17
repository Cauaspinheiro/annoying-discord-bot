defmodule AnnoyingBot.Application do
  use Application

  def start(_type, _args) do
    children = [
      AnnoyingBot.Repo,
      AnnoyingBotWeb.Telemetry,
      {Phoenix.PubSub, name: AnnoyingBot.PubSub},
      AnnoyingBotWeb.Endpoint,
      AnnoyingBot.Discord.Consumer
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AnnoyingBot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AnnoyingBotWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
