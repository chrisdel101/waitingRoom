defmodule WaitingRoom.Repo.Migrations.CreateAlert do
  use Ecto.Migration

  # user does not need email to use basic apply
  def change do
    create table(:alerts) do
      add :active, :boolean
      add :alert_type, :integer
      add :user_id, references(:users)
      add :admin_id, references(:admins)
      timestamps()

    end
  end
end
