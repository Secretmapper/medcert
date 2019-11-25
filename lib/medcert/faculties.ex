defmodule Medcert.Faculties do
  @moduledoc """
  The Faculties context.
  """

  import Ecto.Query, warn: false
  alias Medcert.Repo

  alias Medcert.Faculties.DoctorType

  @doc """
  Returns the list of doctor_types.

  ## Examples

      iex> list_doctor_types()
      [%DoctorType{}, ...]

  """
  def list_doctor_types do
    Repo.all(DoctorType)
  end

  @doc """
  Gets a single doctor_type.

  Raises `Ecto.NoResultsError` if the Doctor type does not exist.

  ## Examples

      iex> get_doctor_type!(123)
      %DoctorType{}

      iex> get_doctor_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_doctor_type!(id), do: Repo.get!(DoctorType, id)

  @doc """
  Creates a doctor_type.

  ## Examples

      iex> create_doctor_type(%{field: value})
      {:ok, %DoctorType{}}

      iex> create_doctor_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_doctor_type(attrs \\ %{}) do
    %DoctorType{}
    |> DoctorType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a doctor_type.

  ## Examples

      iex> update_doctor_type(doctor_type, %{field: new_value})
      {:ok, %DoctorType{}}

      iex> update_doctor_type(doctor_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_doctor_type(%DoctorType{} = doctor_type, attrs) do
    doctor_type
    |> DoctorType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DoctorType.

  ## Examples

      iex> delete_doctor_type(doctor_type)
      {:ok, %DoctorType{}}

      iex> delete_doctor_type(doctor_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_doctor_type(%DoctorType{} = doctor_type) do
    Repo.delete(doctor_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking doctor_type changes.

  ## Examples

      iex> change_doctor_type(doctor_type)
      %Ecto.Changeset{source: %DoctorType{}}

  """
  def change_doctor_type(%DoctorType{} = doctor_type) do
    DoctorType.changeset(doctor_type, %{})
  end

  alias Medcert.Faculties.Doctor

  @doc """
  Returns the list of doctors.

  ## Examples

      iex> list_doctors()
      [%Doctor{}, ...]

  """
  def list_doctors do
    Doctor
    |> Repo.all()
    |> Repo.preload(:type)
  end

  @doc """
  Gets a single doctor.

  Raises `Ecto.NoResultsError` if the Doctor does not exist.

  ## Examples

      iex> get_doctor!(123)
      %Doctor{}

      iex> get_doctor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_doctor!(id) do
    Doctor
    |> Repo.get(id)
    |> Repo.preload(:type)
  end

  @doc """
  Creates a doctor.

  ## Examples

      iex> create_doctor(%{field: value})
      {:ok, %Doctor{}}

      iex> create_doctor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_doctor(attrs \\ %{}) do
    require Logger
    Logger.debug "#{inspect(attrs)}"

    %Doctor{}
    |> Doctor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a doctor.

  ## Examples

      iex> update_doctor(doctor, %{field: new_value})
      {:ok, %Doctor{}}

      iex> update_doctor(doctor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_doctor(%Doctor{} = doctor, attrs) do
    doctor
    |> Doctor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Doctor.

  ## Examples

      iex> delete_doctor(doctor)
      {:ok, %Doctor{}}

      iex> delete_doctor(doctor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_doctor(%Doctor{} = doctor) do
    Repo.delete(doctor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking doctor changes.

  ## Examples

      iex> change_doctor(doctor)
      %Ecto.Changeset{source: %Doctor{}}

  """
  def change_doctor(%Doctor{} = doctor) do
    Doctor.changeset(doctor, %{})
  end
end
