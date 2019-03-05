use Mix.Config

config :apiexample, ApiexampleWeb.Endpoint,
  url: [scheme: "https", host: "petsapi.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE"),
  http: [port: System.get_env("PORT")]

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :apiexample, Apiexample.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
  

# import_config "prod.secret.exs"
