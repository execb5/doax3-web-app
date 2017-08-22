use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :doax3, Doax3Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :doax3, Doax3.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "Unseen2015",
  database: "doax3_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
