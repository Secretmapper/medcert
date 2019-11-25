defmodule Medcert.Repo.Migrations.CreateDoctors do
  use Ecto.Migration

  def change do
    create table(:doctors) do
      add :name, :string
      add :type_id, references(:doctor_types, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:doctors, [:name])
    create index(:doctors, [:type_id])
  end
end
