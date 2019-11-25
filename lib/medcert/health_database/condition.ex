defmodule Medcert.HealthDatabase.Condition do
  use Ecto.Schema
  import Ecto.Changeset

  schema "conditions" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(condition, attrs) do
    condition
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
