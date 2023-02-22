defmodule WaitingRoom.PostsTest do
  use WaitingRoom.DataCase

  alias WaitingRoom.Posts

  describe "messages" do
    alias WaitingRoom.Posts.Message

    import WaitingRoom.PostsFixtures

    @invalid_attrs %{admin_id: nil, id: nil, time_sent: nil, type: nil, user_id: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Posts.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Posts.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{admin_id: 42, id: 42, time_sent: ~D[2023-02-21], type: 42, user_id: 42}

      assert {:ok, %Message{} = message} = Posts.create_message(valid_attrs)
      assert message.admin_id == 42
      assert message.id == 42
      assert message.time_sent == ~D[2023-02-21]
      assert message.type == 42
      assert message.user_id == 42
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{admin_id: 43, id: 43, time_sent: ~D[2023-02-22], type: 43, user_id: 43}

      assert {:ok, %Message{} = message} = Posts.update_message(message, update_attrs)
      assert message.admin_id == 43
      assert message.id == 43
      assert message.time_sent == ~D[2023-02-22]
      assert message.type == 43
      assert message.user_id == 43
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_message(message, @invalid_attrs)
      assert message == Posts.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Posts.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Posts.change_message(message)
    end
  end
end
