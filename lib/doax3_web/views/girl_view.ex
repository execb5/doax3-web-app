defmodule Doax3Web.GirlView do
  use Doax3Web, :view
  alias Doax3Web.GirlView

  def render("index.json", %{girls: girls}) do
    %{data: render_many(girls, GirlView, "girl.json")}
  end

  def render("show.json", %{girl: girl}) do
    %{data: render_one(girl, GirlView, "girl.json")}
  end

  def render("girl.json", %{girl: girl}) do
    %{id: girl.id,
      name: girl.name,
      nationality: girl.nationality,
      age: girl.age,
      birthday: girl.birthday,
      height: girl.height,
      weight: girl.weight,
      bust: girl.bust,
      waist: girl.waist,
      hip: girl.hip,
      hobby: girl.hobby,
      favorite_color: girl.favorite_color}
  end
end
