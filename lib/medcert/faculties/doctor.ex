defmodule Medcert.Faculties.Doctor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Medcert.Faculties.DoctorType

  schema "doctors" do
    field :name, :string
    belongs_to :type, DoctorType

    timestamps()
  end

  @doc false
  def changeset(doctor, attrs) do
    doctor
    |> cast(attrs, [:name, :type_id])
    |> foreign_key_constraint(:type_id)
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
