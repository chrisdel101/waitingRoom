defmodule WaitingRoom.Repo do
  use Ecto.Repo,
    otp_app: :waitingRoom,
    adapter: Ecto.Adapters.Postgres
end
