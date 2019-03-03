defmodule Apiexample.Repo do
  use Ecto.Repo,
    otp_app: :apiexample,
    adapter: Ecto.Adapters.Postgres
end
