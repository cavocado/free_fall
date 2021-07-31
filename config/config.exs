# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :free_fall,
  ecto_repos: [FreeFall.Repo]

# Configures the endpoint
config :free_fall, FreeFallWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "j0x1NyafoJbM0iuBJT27Rfor0gdK0NfB3oorqUhtmS5r84idtYYTyQ8EkOPWgTrK",
  render_errors: [view: FreeFallWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FreeFall.PubSub,
  live_view: [signing_salt: "2n9S1jt+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
