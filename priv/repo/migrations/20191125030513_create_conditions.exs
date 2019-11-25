defmodule Medcert.Repo.Migrations.CreateConditions do
  use Ecto.Migration

  def change do
    create table(:conditions) do
      add :name, :string

      timestamps()
    end

    create unique_index(:conditions, [:name])
  end
end
