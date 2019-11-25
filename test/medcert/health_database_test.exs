defmodule Medcert.HealthDatabaseTest do
  use Medcert.DataCase

  alias Medcert.HealthDatabase

  describe "conditions" do
    alias Medcert.HealthDatabase.Condition

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def condition_fixture(attrs \\ %{}) do
      {:ok, condition} =
        attrs
        |> Enum.into(@valid_attrs)
        |> HealthDatabase.create_condition()

      condition
    end

    test "list_conditions/0 returns all conditions" do
      condition = condition_fixture()
      assert HealthDatabase.list_conditions() == [condition]
    end

    test "get_condition!/1 returns the condition with given id" do
      condition = condition_fixture()
      assert HealthDatabase.get_condition!(condition.id) == condition
    end

    test "create_condition/1 with valid data creates a condition" do
      assert {:ok, %Condition{} = condition} = HealthDatabase.create_condition(@valid_attrs)
      assert condition.name == "some name"
    end

    test "create_condition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = HealthDatabase.create_condition(@invalid_attrs)
    end

    test "update_condition/2 with valid data updates the condition" do
      condition = condition_fixture()
      assert {:ok, %Condition{} = condition} = HealthDatabase.update_condition(condition, @update_attrs)
      assert condition.name == "some updated name"
    end

    test "update_condition/2 with invalid data returns error changeset" do
      condition = condition_fixture()
      assert {:error, %Ecto.Changeset{}} = HealthDatabase.update_condition(condition, @invalid_attrs)
      assert condition == HealthDatabase.get_condition!(condition.id)
    end

    test "delete_condition/1 deletes the condition" do
      condition = condition_fixture()
      assert {:ok, %Condition{}} = HealthDatabase.delete_condition(condition)
      assert_raise Ecto.NoResultsError, fn -> HealthDatabase.get_condition!(condition.id) end
    end

    test "change_condition/1 returns a condition changeset" do
      condition = condition_fixture()
      assert %Ecto.Changeset{} = HealthDatabase.change_condition(condition)
    end
  end
end
