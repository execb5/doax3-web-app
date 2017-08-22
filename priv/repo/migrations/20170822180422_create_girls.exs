defmodule Doax3.Repo.Migrations.CreateGirls do
  use Ecto.Migration

  def change do
    create table(:girls) do
      add :name, :string
      add :nationality, :string
      add :age, :integer
      add :birthday, :date
      add :height, :integer
      add :weight, :integer
      add :bust, :integer
      add :waist, :integer
      add :hip, :integer
      add :hobby, :string
      add :favorite_color, :string

      timestamps()
    end

  end
end
