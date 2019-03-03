use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :apiexample, ApiexampleWeb.Endpoint,
  secret_key_base: "zjIjNR9XGNA2rPFNPd2UVv3oUCeBKWlnz43mxKh0+0rtbQxF0ui1RS7bR5cRNqQq"

# Configure your database
config :apiexample, Apiexample.Repo,
  username: "postgres",
  password: "postgres",
  database: "apiexample_prod",
  pool_size: 15
