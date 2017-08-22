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

# -----------------------------------------------------------
# The game was launched March 26, 2016 - we take this into consideration when inserting birthdays

# Least Favourite Food

# Iced Coffee, Sushi (Marie Rose)
# Fruit Punch, Round Watermelon (Honoka)
# Cream Soda, Cabbage (Kasumi)
# Iced Cafe Au Lait, Cabbage (Ayane)
# Lemon Soda, Chocolate (Kokoro)
# Blancmange, Fresh Banana (Nyotengu)
# Cheesecake, Cream Puff (Hitomi)
# Iced Tea, Fried Chicken (Momiji)
# Orange Juice, Anmitsu (Helena)
# -----------------------------------------------------------

alias Doax3.{Repo, Characters.Girl}

_honoka = %Girl{
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

_marie_rose = %Girl{
  name: "Marie Rose",
  nationality: "Swedish",
  age: 18,
  birthday: %Ecto.Date{ year: 1997, month: 6, day: 6},
  height: 147,
  weight: 39,
  bust: 74,
  waist: 56,
  hip: 76,
  hobby: "Sewing, Watching horror movies",
  favorite_color: "Deep blue"
}
|> Repo.insert!
