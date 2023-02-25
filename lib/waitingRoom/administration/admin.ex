defmodule WaitingRoom.Administration.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :first_name, :string
    field :last_name, :string
    # must be added as atom
    field :role, Ecto.Enum, values:
      [owner: 1, developer: 2, admin: 3, editor: 4, contributor: 5, viewer: 6]
    # creates users
    has_many :users, WaitingRoom.Patient.User
    # sends alerts
    has_many :alerts, WaitingRoom.Alert
    timestamps()
  end

  # TODO#
  # - login, logout


  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:last_name, :first_name, :role])
    |> validate_required([:last_name, :first_name, :role])
  end
end
