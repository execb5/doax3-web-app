# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :doax3_web_app,
  ecto_repos: [Doax3WebApp.Repo]

# Configures the endpoint
config :doax3_web_app, Doax3WebApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CWg7y5b23kjdFgDsHLYUy1LNY66wvl/bdIPL7rsvEiSQCTXaxVr6Rt52psG32uI/",
  render_errors: [view: Doax3WebApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Doax3WebApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
