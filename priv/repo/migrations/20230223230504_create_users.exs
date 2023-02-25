defmodule WaitingRoom.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
        add :first_name, :string
        add :last_name, :string
        add :health_number, :integer
        add :phone, :integer
        add :admin_id, references(:admins)
        timestamps()

    end
  end
end
