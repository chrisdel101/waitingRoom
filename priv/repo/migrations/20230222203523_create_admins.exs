defmodule WaitingRoom.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :last_name, :string
      add :first_name, :string
      add :role, :integer
      add :date_created, :date

      timestamps()
    end
  end
end
