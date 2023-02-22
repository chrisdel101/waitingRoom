defmodule WaitingRoom.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :admin, :integer
    field :contributor, :integer
    field :editor, :integer
    field :owner, :integer
    field :viewer, :integer

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:owner, :admin, :editor, :contributor, :viewer])
    |> validate_required([:owner, :admin, :editor, :contributor, :viewer])
  end
end
