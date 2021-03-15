defmodule AnnoyingBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AnnoyingBot.Repo,
      # Start the Telemetry supervisor
      AnnoyingBotWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AnnoyingBot.PubSub},
      # Start the Endpoint (http/https)
      AnnoyingBotWeb.Endpoint,
      # Start a worker by calling: AnnoyingBot.Worker.start_link(arg)
      # {AnnoyingBot.Worker, arg}
      AnnoyingBot.Discord.CreateMessageConsumer
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
