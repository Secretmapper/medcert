# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Medcert.Repo.insert!(%Medcert.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Medcert.Repo.insert!(%Medcert.Faculties.DoctorType{ name: "Plague Doctor" })
Medcert.Repo.insert!(%Medcert.Faculties.DoctorType{ name: "General Practitioner" })
Medcert.Repo.insert!(%Medcert.Faculties.DoctorType{ name: "Podiatrist" })
Medcert.Repo.insert!(%Medcert.Faculties.DoctorType{ name: "Doctor but actually a Serial Killer" })

Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "NATHAN", type_id: 4 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "SAM", type_id: 3 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "JP", type_id: 2 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "RICARDO", type_id: 2 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "JV", type_id: 2 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "ARLAN", type_id: 2 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "LANCE", type_id: 2 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "JANDEL", type_id: 2 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "MIKH", type_id: 2 })
Medcert.Repo.insert!(%Medcert.Faculties.Doctor{ name: "HANS", type_id: 2 })

Medcert.Repo.insert!(%Medcert.HealthDatabase.Condition{ name: "Dengue" })
Medcert.Repo.insert!(%Medcert.HealthDatabase.Condition{ name: "Poison" })
Medcert.Repo.insert!(%Medcert.HealthDatabase.Condition{ name: "Fireball" })
Medcert.Repo.insert!(%Medcert.HealthDatabase.Condition{ name: "Iceball" })
Medcert.Repo.insert!(%Medcert.HealthDatabase.Condition{ name: "Waterball" })
Medcert.Repo.insert!(%Medcert.HealthDatabase.Condition{ name: "Airball" })
