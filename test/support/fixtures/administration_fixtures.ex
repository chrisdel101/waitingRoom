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

  def unique_admin_email, do: "admin#{System.unique_integer()}@example.com"
  def valid_admin_password, do: "hello world!"

  def valid_admin_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_admin_email(),
      password: valid_admin_password()
    })
  end

  def admin_fixture(attrs \\ %{}) do
    {:ok, admin} =
      attrs
      |> valid_admin_attributes()
      |> WaitingRoom.Administration.register_admin()

    admin
  end

  def extract_admin_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end
