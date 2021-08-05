defmodule FreeFall.Repo do
  use Ecto.Repo,
    otp_app: :free_fall,
    adapter: Ecto.Adapters.Postgres
end
