defmodule WaitingRoom.AdminsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WaitingRoom.Admins` context.
  """

  @doc """
  Generate a admin.
  """
  def admin_fixture(attrs \\ %{}) do
    {:ok, admin} =
      attrs
      |> Enum.into(%{
        date_created: ~D[2023-02-21],
        first_name: "some first_name",
        id: 42,
        last_name: "some last_name",
        role: 42
      })
      |> WaitingRoom.Admins.create_admin()

    admin
  end
end
