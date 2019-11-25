defmodule Medcert.Repo.Migrations.CreateDoctorTypes do
  use Ecto.Migration

  def change do
    create table(:doctor_types) do
      add :name, :string

      timestamps()
    end

    create unique_index(:doctor_types, [:name])
  end
end
