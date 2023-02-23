defmodule WaitingRoom.Alert do
  use Ecto.Schema
  import Ecto.Changeset

  schema "alerts" do
    field :active, :boolean, default: false
    field :time_sent, :date
    belongs_to :user, User
    belongs_to :admin, Admin
    field :alert_type, Ecto.Enum, values: [initial: 1, confirmation: 2, req_for_conf: 3, cancellation: 4, change: 5]
    timestamps()
  end

  @doc false
  def changeset(alert, attrs) do
    alert
    |> cast(attrs, [:time_sent, :alert_type, :active])
    |> validate_required([:time_sent, :alert_type, :active])
  end
end
