defmodule Medcert.Faculties.DoctorType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "doctor_types" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(doctor_type, attrs) do
    doctor_type
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
