defmodule WaitingRoom.Admins.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :date_created, :date
    field :first_name, :string
    field :last_name, :string
    field :role, :integer

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:last_name, :first_name, :role, :date_created])
    |> validate_required([:last_name, :first_name, :role, :date_created])
  end
end
