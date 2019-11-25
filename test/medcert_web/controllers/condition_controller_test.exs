defmodule MedcertWeb.ConditionControllerTest do
  use MedcertWeb.ConnCase

  alias Medcert.HealthDatabase

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:condition) do
    {:ok, condition} = HealthDatabase.create_condition(@create_attrs)
    condition
  end

  describe "index" do
    test "lists all conditions", %{conn: conn} do
      conn = get(conn, Routes.condition_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Conditions"
    end
  end

  describe "new condition" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.condition_path(conn, :new))
      assert html_response(conn, 200) =~ "New Condition"
    end
  end

  describe "create condition" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.condition_path(conn, :create), condition: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.condition_path(conn, :show, id)

      conn = get(conn, Routes.condition_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Condition"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.condition_path(conn, :create), condition: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Condition"
    end
  end

  describe "edit condition" do
    setup [:create_condition]

    test "renders form for editing chosen condition", %{conn: conn, condition: condition} do
      conn = get(conn, Routes.condition_path(conn, :edit, condition))
      assert html_response(conn, 200) =~ "Edit Condition"
    end
  end

  describe "update condition" do
    setup [:create_condition]

    test "redirects when data is valid", %{conn: conn, condition: condition} do
      conn = put(conn, Routes.condition_path(conn, :update, condition), condition: @update_attrs)
      assert redirected_to(conn) == Routes.condition_path(conn, :show, condition)

      conn = get(conn, Routes.condition_path(conn, :show, condition))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, condition: condition} do
      conn = put(conn, Routes.condition_path(conn, :update, condition), condition: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Condition"
    end
  end

  describe "delete condition" do
    setup [:create_condition]

    test "deletes chosen condition", %{conn: conn, condition: condition} do
      conn = delete(conn, Routes.condition_path(conn, :delete, condition))
      assert redirected_to(conn) == Routes.condition_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.condition_path(conn, :show, condition))
      end
    end
  end

  defp create_condition(_) do
    condition = fixture(:condition)
    {:ok, condition: condition}
  end
end
