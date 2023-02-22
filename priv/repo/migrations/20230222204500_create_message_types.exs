defmodule WaitingRoom.Repo.Migrations.CreateMessageTypes do
  use Ecto.Migration

  def change do
    create table(:message_types) do
      add :initial, :integer
      add :confirmation, :integer
      add :req_for_conf, :integer
      add :cancellation, :integer
      add :change, :integer

      timestamps()
    end
  end
end
