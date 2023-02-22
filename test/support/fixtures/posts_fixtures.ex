defmodule WaitingRoom.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WaitingRoom.Posts` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        admin_id: 42,
        id: 42,
        time_sent: ~D[2023-02-21],
        type: 42,
        user_id: 42
      })
      |> WaitingRoom.Posts.create_message()

    message
  end
end
