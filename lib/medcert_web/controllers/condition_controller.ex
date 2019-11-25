defmodule MedcertWeb.ConditionController do
  use MedcertWeb, :controller

  alias Medcert.HealthDatabase
  alias Medcert.HealthDatabase.Condition

  def index(conn, _params) do
    conditions = HealthDatabase.list_conditions()
    render(conn, "index.html", conditions: conditions)
  end

  def new(conn, _params) do
    changeset = HealthDatabase.change_condition(%Condition{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"condition" => condition_params}) do
    case HealthDatabase.create_condition(condition_params) do
      {:ok, condition} ->
        conn
        |> put_flash(:info, "Condition created successfully.")
        |> redirect(to: Routes.condition_path(conn, :show, condition))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    condition = HealthDatabase.get_condition!(id)
    render(conn, "show.html", condition: condition)
  end

  def edit(conn, %{"id" => id}) do
    condition = HealthDatabase.get_condition!(id)
    changeset = HealthDatabase.change_condition(condition)
    render(conn, "edit.html", condition: condition, changeset: changeset)
  end

  def update(conn, %{"id" => id, "condition" => condition_params}) do
    condition = HealthDatabase.get_condition!(id)

    case HealthDatabase.update_condition(condition, condition_params) do
      {:ok, condition} ->
        conn
        |> put_flash(:info, "Condition updated successfully.")
        |> redirect(to: Routes.condition_path(conn, :show, condition))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", condition: condition, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    condition = HealthDatabase.get_condition!(id)
    {:ok, _condition} = HealthDatabase.delete_condition(condition)

    conn
    |> put_flash(:info, "Condition deleted successfully.")
    |> redirect(to: Routes.condition_path(conn, :index))
  end
end
