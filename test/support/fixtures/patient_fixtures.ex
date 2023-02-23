defmodule WaitingRoom.PatientFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WaitingRoom.Patient` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        created_by: 42,
        first_name: "some first_name",
        health_num: 42,
        id: 42,
        last_name: "some last_name",
        phone: 42
      })
      |> WaitingRoom.Patient.create_user()

    user
  end
end
