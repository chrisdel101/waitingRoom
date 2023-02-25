defmodule WaitingRoom.Alert do
  use Ecto.Schema
  import Ecto.Changeset

  schema "alerts" do
    field :active, :boolean
    belongs_to :user_id, WaitingRoom.Patient.User
    belongs_to :admin_id, WaitingRoom.Administration.Admin
    field :alert_type, Ecto.Enum, values: [initial: 1, confirmation: 2, req_for_conf: 3, cancellation: 4, change: 5]
    timestamps()
  end

  @doc false
  def changeset(alert, attrs) do
    alert
    |> cast(attrs, [:alert_type, :active])
    |> cast_assoc(:user_id)
    |> cast_assoc(:admin_id)
    |> validate_required([:alert_type, :active, :user_id, :admin_id])
  end
end
