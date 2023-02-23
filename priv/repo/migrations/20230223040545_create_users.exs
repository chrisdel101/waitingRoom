defmodule WaitingRoom.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :id, :integer
      add :last_name, :string
      add :first_name, :string
      add :health_num, :integer
      add :phone, :integer
      belongs_to :created_by, Admin
      has_many :alerts, Alert

      timestamps()
    end
  end
end
