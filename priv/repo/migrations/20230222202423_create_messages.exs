defmodule WaitingRoom.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user_id, :integer
      add :admin_id, :integer
      add :time_sent, :date
      add :type, :integer

      timestamps()
    end
  end
end
