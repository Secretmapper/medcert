defmodule Medcert.Repo do
  use Ecto.Repo,
    otp_app: :medcert,
    adapter: Ecto.Adapters.Postgres
end
