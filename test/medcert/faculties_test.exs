defmodule Medcert.FacultiesTest do
  use Medcert.DataCase

  alias Medcert.Faculties

  describe "doctor_types" do
    alias Medcert.Faculties.DoctorType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def doctor_type_fixture(attrs \\ %{}) do
      {:ok, doctor_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Faculties.create_doctor_type()

      doctor_type
    end

    test "list_doctor_types/0 returns all doctor_types" do
      doctor_type = doctor_type_fixture()
      assert Faculties.list_doctor_types() == [doctor_type]
    end

    test "get_doctor_type!/1 returns the doctor_type with given id" do
      doctor_type = doctor_type_fixture()
      assert Faculties.get_doctor_type!(doctor_type.id) == doctor_type
    end

    test "create_doctor_type/1 with valid data creates a doctor_type" do
      assert {:ok, %DoctorType{} = doctor_type} = Faculties.create_doctor_type(@valid_attrs)
      assert doctor_type.name == "some name"
    end

    test "create_doctor_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Faculties.create_doctor_type(@invalid_attrs)
    end

    test "update_doctor_type/2 with valid data updates the doctor_type" do
      doctor_type = doctor_type_fixture()
      assert {:ok, %DoctorType{} = doctor_type} = Faculties.update_doctor_type(doctor_type, @update_attrs)
      assert doctor_type.name == "some updated name"
    end

    test "update_doctor_type/2 with invalid data returns error changeset" do
      doctor_type = doctor_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Faculties.update_doctor_type(doctor_type, @invalid_attrs)
      assert doctor_type == Faculties.get_doctor_type!(doctor_type.id)
    end

    test "delete_doctor_type/1 deletes the doctor_type" do
      doctor_type = doctor_type_fixture()
      assert {:ok, %DoctorType{}} = Faculties.delete_doctor_type(doctor_type)
      assert_raise Ecto.NoResultsError, fn -> Faculties.get_doctor_type!(doctor_type.id) end
    end

    test "change_doctor_type/1 returns a doctor_type changeset" do
      doctor_type = doctor_type_fixture()
      assert %Ecto.Changeset{} = Faculties.change_doctor_type(doctor_type)
    end
  end

  describe "doctors" do
    alias Medcert.Faculties.Doctor

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def doctor_fixture(attrs \\ %{}) do
      {:ok, doctor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Faculties.create_doctor()

      doctor
    end

    test "list_doctors/0 returns all doctors" do
      doctor = doctor_fixture()
      assert Faculties.list_doctors() == [doctor]
    end

    test "get_doctor!/1 returns the doctor with given id" do
      doctor = doctor_fixture()
      assert Faculties.get_doctor!(doctor.id) == doctor
    end

    test "create_doctor/1 with valid data creates a doctor" do
      assert {:ok, %Doctor{} = doctor} = Faculties.create_doctor(@valid_attrs)
      assert doctor.name == "some name"
    end

    test "create_doctor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Faculties.create_doctor(@invalid_attrs)
    end

    test "update_doctor/2 with valid data updates the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{} = doctor} = Faculties.update_doctor(doctor, @update_attrs)
      assert doctor.name == "some updated name"
    end

    test "update_doctor/2 with invalid data returns error changeset" do
      doctor = doctor_fixture()
      assert {:error, %Ecto.Changeset{}} = Faculties.update_doctor(doctor, @invalid_attrs)
      assert doctor == Faculties.get_doctor!(doctor.id)
    end

    test "delete_doctor/1 deletes the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{}} = Faculties.delete_doctor(doctor)
      assert_raise Ecto.NoResultsError, fn -> Faculties.get_doctor!(doctor.id) end
    end

    test "change_doctor/1 returns a doctor changeset" do
      doctor = doctor_fixture()
      assert %Ecto.Changeset{} = Faculties.change_doctor(doctor)
    end
  end
end
