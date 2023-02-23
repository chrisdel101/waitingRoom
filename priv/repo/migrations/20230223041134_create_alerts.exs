defmodule WaitingRoom.Repo.Migrations.CreateAlerts do
  use Ecto.Migration

  def change do
    create table(:alerts) do
      belongs_to :user, User
      belongs_to :admin, Admin
      field :alert_type, AlertTypesEnum.type()
      add :time_sent, :date
      add :active, :boolean, default: false, null: false

      timestamps()
    end
  end
end
