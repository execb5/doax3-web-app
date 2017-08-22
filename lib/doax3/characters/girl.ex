defmodule Doax3.Characters.Girl do
  use Ecto.Schema
  import Ecto.Changeset
  alias Doax3.Characters.Girl


  schema "girls" do
    field :age, :integer
    field :birthday, :date
    field :bust, :integer
    field :favorite_color, :string
    field :height, :integer
    field :hip, :integer
    field :hobby, :string
    field :name, :string
    field :nationality, :string
    field :waist, :integer
    field :weight, :integer

    timestamps()
  end

  @doc false
  def changeset(%Girl{} = girl, attrs) do
    girl
    |> cast(attrs, [:name, :nationality, :age, :birthday, :height, :weight, :bust, :waist, :hip, :hobby, :favorite_color])
    |> validate_required([:name, :nationality, :age, :birthday, :height, :weight, :bust, :waist, :hip, :hobby, :favorite_color])
  end
end
