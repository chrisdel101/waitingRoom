defmodule WaitingRoom.Posts.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :admin_id, :integer
    field :time_sent, :date
    field :type, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:user_id, :admin_id, :time_sent, :type])
    |> validate_required([:user_id, :admin_id, :time_sent, :type])
  end
end
