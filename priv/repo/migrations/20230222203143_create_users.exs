defmodule WaitingRoom.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :last_name, :string
      add :first_name, :string
      add :health_num, :integer
      add :phone, :integer

      timestamps()
    end
  end
end
