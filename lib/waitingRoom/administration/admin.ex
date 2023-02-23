defmodule WaitingRoom.Administration.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :date_created, :date
    field :first_name, :string
    field :last_name, :string
    field :role, Ecto.Enum, values:
      [owner: 1, developer: 2, admin: 3, editor: 4, contributor: 5, viewer: 6]
    has_many :users, User
    has_many :alerts, Alert
    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:last_name, :first_name, :role, :date_created])
    |> validate_required([:last_name, :first_name, :role, :date_created])
  end
end
