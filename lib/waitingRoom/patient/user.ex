defmodule WaitingRoom.Patient.User do
  alias WaitingRoom.Alert
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :health_num, :integer
    field :last_name, :string
    field :phone, :integer
    belongs_to :created_by, Admin
    has_many :alerts, Alert

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [ :last_name, :first_name, :health_num, :phone])
    |> validate_required([ :last_name, :first_name, :health_num, :phone])
  end
end
