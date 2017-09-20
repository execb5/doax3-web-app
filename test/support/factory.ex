defmodule Doax3.Factory do

  use ExMachina.Ecto, repo: Doax3.Repo

  alias Doax3.Characters.Girl

  def girl_factory do
    %Girl{
      age: 18,
      birthday: %Ecto.Date{year: 1995, month: 1, day: 1},
      bust: 100,
      favorite_color: "Black",
      height: 150,
      hip: 100,
      hobby: "Play doax3",
      name: "Girl name",
      nationality: "Brazillian",
      waist: 50,
      weight: 50,
    }
  end

end
