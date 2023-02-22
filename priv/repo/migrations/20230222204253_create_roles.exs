defmodule WaitingRoom.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :owner, :integer
      add :admin, :integer
      add :editor, :integer
      add :contributor, :integer
      add :viewer, :integer

      timestamps()
    end
  end
end
