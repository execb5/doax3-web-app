# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Doax3.Repo.insert!(%Doax3.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Doax3.{Repo, Characters.Girl}

honoka = %Girl{
  name: "Honoka",
  nationality: "Japanese",
  age: 18,
  birthday: %Ecto.Date{ year: 1998, month: 3, day: 24},
  height: 150,
  weight: 45,
  bust: 99,
  waist: 58,
  hip: 91,
  hobby: "Watching pro wrestling and martial arts movies, taking baths",
  favorite_color: "Cream"
}
|> Repo.insert!
