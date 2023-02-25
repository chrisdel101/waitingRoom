defmodule WaitingRoom.Repo.Migrations.CreateAdmin do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :first_name, :string
      add :last_name, :string
      add :role, :integer
    end
  end
end
