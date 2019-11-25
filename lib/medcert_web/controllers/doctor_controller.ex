defmodule MedcertWeb.DoctorController do
  use MedcertWeb, :controller

  alias Medcert.Faculties
  alias Medcert.Faculties.Doctor

  def index(conn, _params) do
    doctors = Faculties.list_doctors()
    render(conn, "index.html", doctors: doctors)
  end

  def new(conn, _params) do
    changeset = Faculties.change_doctor(%Doctor{})
    render(conn, "new.html", changeset: changeset, doctor_types: doctor_types)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    case Faculties.create_doctor(doctor_params) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor created successfully.")
        |> redirect(to: Routes.doctor_path(conn, :show, doctor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, doctor_types: doctor_types)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Faculties.get_doctor!(id)
    render(conn, "show.html", doctor: doctor)
  end

  def edit(conn, %{"id" => id}) do
    doctor = Faculties.get_doctor!(id)
    changeset = Faculties.change_doctor(doctor)
    render(conn, "edit.html", doctor: doctor, changeset: changeset, doctor_types: doctor_types)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Faculties.get_doctor!(id)

    case Faculties.update_doctor(doctor, doctor_params) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor updated successfully.")
        |> redirect(to: Routes.doctor_path(conn, :show, doctor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", doctor: doctor, changeset: changeset, doctor_types: doctor_types)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor = Faculties.get_doctor!(id)
    {:ok, _doctor} = Faculties.delete_doctor(doctor)

    conn
    |> put_flash(:info, "Doctor deleted successfully.")
    |> redirect(to: Routes.doctor_path(conn, :index))
  end

  defp doctor_types() do
    Faculties.list_doctor_types() |> Enum.map(&{&1.name, &1.id})
  end
end
