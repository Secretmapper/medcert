defmodule Medcert.Faculties do
  @moduledoc """
  The Faculties context.
  """

  import Ecto.Query, warn: false
  alias Medcert.Repo

  alias Medcert.Faculties.DoctorType

  def list_doctor_types do
    Repo.all(DoctorType)
  end

  def get_doctor_type!(id), do: Repo.get!(DoctorType, id)

  def create_doctor_type(attrs \\ %{}) do
    %DoctorType{}
    |> DoctorType.changeset(attrs)
    |> Repo.insert()
  end

  def update_doctor_type(%DoctorType{} = doctor_type, attrs) do
    doctor_type
    |> DoctorType.changeset(attrs)
    |> Repo.update()
  end

  def delete_doctor_type(%DoctorType{} = doctor_type) do
    Repo.delete(doctor_type)
  end

  def change_doctor_type(%DoctorType{} = doctor_type) do
    DoctorType.changeset(doctor_type, %{})
  end

  alias Medcert.Faculties.Doctor

  def list_doctors do
    Doctor
    |> Repo.all()
    |> Repo.preload(:type)
  end

  def get_doctor!(id) do
    Doctor
    |> Repo.get(id)
    |> Repo.preload(:type)
  end

  def create_doctor(attrs \\ %{}) do
    require Logger
    Logger.debug "#{inspect(attrs)}"

    %Doctor{}
    |> Doctor.changeset(attrs)
    |> Repo.insert()
  end

  def update_doctor(%Doctor{} = doctor, attrs) do
    doctor
    |> Doctor.changeset(attrs)
    |> Repo.update()
  end

  def delete_doctor(%Doctor{} = doctor) do
    Repo.delete(doctor)
  end

  def change_doctor(%Doctor{} = doctor) do
    Doctor.changeset(doctor, %{})
  end
end
