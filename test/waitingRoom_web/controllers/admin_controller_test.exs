defmodule WaitingRoomWeb.AdminControllerTest do
  use WaitingRoomWeb.ConnCase

  import WaitingRoom.AdministrationFixtures

  @create_attrs %{date_created: ~D[2023-02-22], first_name: "some first_name", id: 42, last_name: "some last_name", role: 42}
  @update_attrs %{date_created: ~D[2023-02-23], first_name: "some updated first_name", id: 43, last_name: "some updated last_name", role: 43}
  @invalid_attrs %{date_created: nil, first_name: nil, id: nil, last_name: nil, role: nil}

  describe "index" do
    test "lists all admins", %{conn: conn} do
      conn = get(conn, Routes.admin_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Admins"
    end
  end

  describe "new admin" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_path(conn, :new))
      assert html_response(conn, 200) =~ "New Admin"
    end
  end

  describe "create admin" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_path(conn, :create), admin: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_path(conn, :show, id)

      conn = get(conn, Routes.admin_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Admin"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_path(conn, :create), admin: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Admin"
    end
  end

  describe "edit admin" do
    setup [:create_admin]

    test "renders form for editing chosen admin", %{conn: conn, admin: admin} do
      conn = get(conn, Routes.admin_path(conn, :edit, admin))
      assert html_response(conn, 200) =~ "Edit Admin"
    end
  end

  describe "update admin" do
    setup [:create_admin]

    test "redirects when data is valid", %{conn: conn, admin: admin} do
      conn = put(conn, Routes.admin_path(conn, :update, admin), admin: @update_attrs)
      assert redirected_to(conn) == Routes.admin_path(conn, :show, admin)

      conn = get(conn, Routes.admin_path(conn, :show, admin))
      assert html_response(conn, 200) =~ "some updated first_name"
    end

    test "renders errors when data is invalid", %{conn: conn, admin: admin} do
      conn = put(conn, Routes.admin_path(conn, :update, admin), admin: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Admin"
    end
  end

  describe "delete admin" do
    setup [:create_admin]

    test "deletes chosen admin", %{conn: conn, admin: admin} do
      conn = delete(conn, Routes.admin_path(conn, :delete, admin))
      assert redirected_to(conn) == Routes.admin_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.admin_path(conn, :show, admin))
      end
    end
  end

  defp create_admin(_) do
    admin = admin_fixture()
    %{admin: admin}
  end
end
