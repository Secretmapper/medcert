defmodule Medcert.HealthDatabase do
  @moduledoc """
  The HealthDatabase context.
  """

  import Ecto.Query, warn: false
  alias Medcert.Repo

  alias Medcert.HealthDatabase.Condition

  def list_conditions do
    Repo.all(Condition)
  end

  def get_condition!(id), do: Repo.get!(Condition, id)

  def create_condition(attrs \\ %{}) do
    %Condition{}
    |> Condition.changeset(attrs)
    |> Repo.insert()
  end

  def update_condition(%Condition{} = condition, attrs) do
    condition
    |> Condition.changeset(attrs)
    |> Repo.update()
  end

  def delete_condition(%Condition{} = condition) do
    Repo.delete(condition)
  end

  def change_condition(%Condition{} = condition) do
    Condition.changeset(condition, %{})
  end
end
