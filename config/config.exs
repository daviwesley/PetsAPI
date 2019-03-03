# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :apiexample,
  ecto_repos: [Apiexample.Repo]

# Configures the endpoint
config :apiexample, ApiexampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "EkPakpVaYt1W4djhwfeJjbm/w+yvNHAL7i8ic8nG95tvZFJZTnL+7vo0xjIqv2PO",
  render_errors: [view: ApiexampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Apiexample.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
