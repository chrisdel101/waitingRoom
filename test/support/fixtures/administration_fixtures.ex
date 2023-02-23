defmodule WaitingRoom.AdministrationFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WaitingRoom.Administration` context.
  """

  @doc """
  Generate a admin.
  """
  def admin_fixture(attrs \\ %{}) do
    {:ok, admin} =
      attrs
      |> Enum.into(%{
        date_created: ~D[2023-02-22],
        first_name: "some first_name",
        id: 42,
        last_name: "some last_name",
        role: 42
      })
      |> WaitingRoom.Administration.create_admin()

    admin
  end
end
