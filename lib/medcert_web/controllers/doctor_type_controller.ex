defmodule MedcertWeb.DoctorTypeController do
  use MedcertWeb, :controller

  alias Medcert.Faculties
  alias Medcert.Faculties.DoctorType

  def index(conn, _params) do
    doctor_types = Faculties.list_doctor_types()
    render(conn, "index.html", doctor_types: doctor_types)
  end

  def new(conn, _params) do
    changeset = Faculties.change_doctor_type(%DoctorType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"doctor_type" => doctor_type_params}) do
    case Faculties.create_doctor_type(doctor_type_params) do
      {:ok, doctor_type} ->
        conn
        |> put_flash(:info, "Doctor type created successfully.")
        |> redirect(to: Routes.doctor_type_path(conn, :show, doctor_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor_type = Faculties.get_doctor_type!(id)
    render(conn, "show.html", doctor_type: doctor_type)
  end

  def edit(conn, %{"id" => id}) do
    doctor_type = Faculties.get_doctor_type!(id)
    changeset = Faculties.change_doctor_type(doctor_type)
    render(conn, "edit.html", doctor_type: doctor_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "doctor_type" => doctor_type_params}) do
    doctor_type = Faculties.get_doctor_type!(id)

    case Faculties.update_doctor_type(doctor_type, doctor_type_params) do
      {:ok, doctor_type} ->
        conn
        |> put_flash(:info, "Doctor type updated successfully.")
        |> redirect(to: Routes.doctor_type_path(conn, :show, doctor_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", doctor_type: doctor_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor_type = Faculties.get_doctor_type!(id)
    {:ok, _doctor_type} = Faculties.delete_doctor_type(doctor_type)

    conn
    |> put_flash(:info, "Doctor type deleted successfully.")
    |> redirect(to: Routes.doctor_type_path(conn, :index))
  end
end
