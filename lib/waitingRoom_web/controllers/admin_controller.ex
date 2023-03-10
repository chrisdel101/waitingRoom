defmodule WaitingRoomWeb.AdminController do
  use WaitingRoomWeb, :controller

  alias WaitingRoom.Administration
  alias WaitingRoom.Administration.Admin

  def index(conn, _params) do
    admins = Administration.list_admins()
    render(conn, "index.html", admins: admins)
  end

  def enum_options_for(module) do
    Enum.map(module.__enum_map__(), fn {e, _n} -> to_string(e) end)
  end
    def new(conn, _params) do
      changeset = Administration.change_admin(%Admin{})

      render(conn, "new.html", changeset: changeset)
    end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"admin" => admin_params}) do
    case Administration.create_admin(admin_params) do
      {:ok, admin} ->
        conn
        |> put_flash(:info, "Admin created successfully.")
        |> redirect(to: Routes.admin_path(conn, :show, admin))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    admin = Administration.get_admin!(id)
    render(conn, "show.html", admin: admin)
  end

  def edit(conn, %{"id" => id}) do
    admin = Administration.get_admin!(id)
    changeset = Administration.change_admin(admin)
    render(conn, "edit.html", admin: admin, changeset: changeset)
  end

  def update(conn, %{"id" => id, "admin" => admin_params}) do
    admin = Administration.get_admin!(id)

    case Administration.update_admin(admin, admin_params) do
      {:ok, admin} ->
        conn
        |> put_flash(:info, "Admin updated successfully.")
        |> redirect(to: Routes.admin_path(conn, :show, admin))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", admin: admin, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    admin = Administration.get_admin!(id)
    {:ok, _admin} = Administration.delete_admin(admin)

    conn
    |> put_flash(:info, "Admin deleted successfully.")
    |> redirect(to: Routes.admin_path(conn, :index))
  end
end
