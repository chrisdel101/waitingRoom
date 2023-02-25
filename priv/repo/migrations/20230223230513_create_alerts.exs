defmodule WaitingRoom.Repo.Migrations.CreateAlert do
  use Ecto.Migration

  def change do
    create table(:alerts) do
      add :active, :boolean
      add :alert_type, :integer
      add :user_id, references(:users)
      add :admin_id, references(:admins)
    end
  end
end
