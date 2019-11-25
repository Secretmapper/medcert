defmodule MedcertWeb.DoctorTypeControllerTest do
  use MedcertWeb.ConnCase

  alias Medcert.Faculties

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:doctor_type) do
    {:ok, doctor_type} = Faculties.create_doctor_type(@create_attrs)
    doctor_type
  end

  describe "index" do
    test "lists all doctor_types", %{conn: conn} do
      conn = get(conn, Routes.doctor_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Doctor types"
    end
  end

  describe "new doctor_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.doctor_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Doctor type"
    end
  end

  describe "create doctor_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.doctor_type_path(conn, :create), doctor_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.doctor_type_path(conn, :show, id)

      conn = get(conn, Routes.doctor_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Doctor type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.doctor_type_path(conn, :create), doctor_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Doctor type"
    end
  end

  describe "edit doctor_type" do
    setup [:create_doctor_type]

    test "renders form for editing chosen doctor_type", %{conn: conn, doctor_type: doctor_type} do
      conn = get(conn, Routes.doctor_type_path(conn, :edit, doctor_type))
      assert html_response(conn, 200) =~ "Edit Doctor type"
    end
  end

  describe "update doctor_type" do
    setup [:create_doctor_type]

    test "redirects when data is valid", %{conn: conn, doctor_type: doctor_type} do
      conn = put(conn, Routes.doctor_type_path(conn, :update, doctor_type), doctor_type: @update_attrs)
      assert redirected_to(conn) == Routes.doctor_type_path(conn, :show, doctor_type)

      conn = get(conn, Routes.doctor_type_path(conn, :show, doctor_type))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, doctor_type: doctor_type} do
      conn = put(conn, Routes.doctor_type_path(conn, :update, doctor_type), doctor_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Doctor type"
    end
  end

  describe "delete doctor_type" do
    setup [:create_doctor_type]

    test "deletes chosen doctor_type", %{conn: conn, doctor_type: doctor_type} do
      conn = delete(conn, Routes.doctor_type_path(conn, :delete, doctor_type))
      assert redirected_to(conn) == Routes.doctor_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.doctor_type_path(conn, :show, doctor_type))
      end
    end
  end

  defp create_doctor_type(_) do
    doctor_type = fixture(:doctor_type)
    {:ok, doctor_type: doctor_type}
  end
end
