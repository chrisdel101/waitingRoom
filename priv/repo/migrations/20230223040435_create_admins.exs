defmodule WaitingRoom.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :id, :integer
      add :last_name, :string
      add :first_name, :string
      add :date_created, :date
      add :role, Ecto.Enum, values:
      [owner: 1, developer: 2, admin: 3, editor: 4, contributor: 5, viewer: 6]
      has_many :users, User
      has_many :alerts, Alert

      timestamps()
    end
  end
end
