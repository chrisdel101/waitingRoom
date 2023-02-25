defmodule WaitingRoom.Patient.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :health_number, :integer
    field :phone, :integer
    belongs_to :admin, WaitingRoom.Administration.Admin
    has_many :alerts, WaitingRoom.Alert
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :health_number, :phone])
    |> validate_required(
      [:first_name, :last_name, :health_number])
  end
end
