# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :annoying_bot,
  ecto_repos: [AnnoyingBot.Repo]

# Configures the endpoint
config :annoying_bot, AnnoyingBotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ba78dqUvRISQra7DndR6z3GJvjnZJoDlWXom7TZTn19EOg9+WsF4VKpZy8Sq0ZQI",
  render_errors: [view: AnnoyingBotWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AnnoyingBot.PubSub,
  live_view: [signing_salt: "Q+BNmfJ4"]

config :annoying_bot, AnnoyingBot.Repo,
  migration_primary_key: [type: :binary_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :nostrum,
  token: "ODE3MDMzNjk4OTY4MjA3MzYx.YEDn7Q.bhl9tNUkzdNR53xhOHCmHBnfa2s", # The token of your bot as a string
  num_shards: :auto # The number of shards you want to run your bot under, or :auto.

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
