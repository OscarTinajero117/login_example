defmodule LoginExample.Repo do
  use Ecto.Repo,
    otp_app: :login_example,
    adapter: Ecto.Adapters.Tds
end
