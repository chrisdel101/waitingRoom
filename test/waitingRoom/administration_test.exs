defmodule WaitingRoom.AdministrationTest do
  use WaitingRoom.DataCase

  alias WaitingRoom.Administration

  describe "admins" do
    alias WaitingRoom.Administration.Admin

    import WaitingRoom.AdministrationFixtures

    @invalid_attrs %{date_created: nil, first_name: nil, id: nil, last_name: nil, role: nil}

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Administration.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Administration.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      valid_attrs = %{date_created: ~D[2023-02-22], first_name: "some first_name", id: 42, last_name: "some last_name", role: 42}

      assert {:ok, %Admin{} = admin} = Administration.create_admin(valid_attrs)
      assert admin.date_created == ~D[2023-02-22]
      assert admin.first_name == "some first_name"
      assert admin.id == 42
      assert admin.last_name == "some last_name"
      assert admin.role == 42
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Administration.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      update_attrs = %{date_created: ~D[2023-02-23], first_name: "some updated first_name", id: 43, last_name: "some updated last_name", role: 43}

      assert {:ok, %Admin{} = admin} = Administration.update_admin(admin, update_attrs)
      assert admin.date_created == ~D[2023-02-23]
      assert admin.first_name == "some updated first_name"
      assert admin.id == 43
      assert admin.last_name == "some updated last_name"
      assert admin.role == 43
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Administration.update_admin(admin, @invalid_attrs)
      assert admin == Administration.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Administration.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Administration.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Administration.change_admin(admin)
    end
  end
end
