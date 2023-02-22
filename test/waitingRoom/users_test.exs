defmodule WaitingRoom.UsersTest do
  use WaitingRoom.DataCase

  alias WaitingRoom.Users

  describe "users" do
    alias WaitingRoom.Users.User

    import WaitingRoom.UsersFixtures

    @invalid_attrs %{first_name: nil, health_num: nil, id: nil, last_name: nil, phone: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{first_name: "some first_name", health_num: 42, id: 42, last_name: "some last_name", phone: 42}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.first_name == "some first_name"
      assert user.health_num == 42
      assert user.id == 42
      assert user.last_name == "some last_name"
      assert user.phone == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{first_name: "some updated first_name", health_num: 43, id: 43, last_name: "some updated last_name", phone: 43}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.first_name == "some updated first_name"
      assert user.health_num == 43
      assert user.id == 43
      assert user.last_name == "some updated last_name"
      assert user.phone == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
