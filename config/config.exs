# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cfp,
  ecto_repos: [Cfp.Repo]

# Configures the endpoint
config :cfp, CfpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cEAl7MED5UrLy+8M/ySUG5UCqUQEuJ5cx6fFjlHc0umvoiqtRY1yd8EGt6vdf4+E",
  render_errors: [view: CfpWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cfp.PubSub,
           adapter: Phoenix.PubSub.PG2],
  slack_workspace: (System.get_env("SLACK_NAME") || "lillefp"),
  slack_token: System.get_env("SLACK_TOKEN"),
  github_organization: (System.get_env("GITHUB_ORGANIZATION") || "lillefp"),
  github_board: (System.get_env("GITHUB_BOARD_NAME") || "board")


config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github,
	     [default_scope: "user,read:org"]}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
