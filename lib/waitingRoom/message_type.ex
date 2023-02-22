defmodule WaitingRoom.MessageType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message_types" do
    field :cancellation, :integer
    field :change, :integer
    field :confirmation, :integer
    field :initial, :integer
    field :req_for_conf, :integer

    timestamps()
  end

  @doc false
  def changeset(message_type, attrs) do
    message_type
    |> cast(attrs, [:initial, :confirmation, :req_for_conf, :cancellation, :change])
    |> validate_required([:initial, :confirmation, :req_for_conf, :cancellation, :change])
  end
end
