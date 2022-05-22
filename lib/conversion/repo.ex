defmodule Conversion.Repo do
  use Ecto.Repo,
    otp_app: :conversion,
    adapter: Ecto.Adapters.Postgres
end
