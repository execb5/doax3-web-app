defmodule Doax3.CharactersTest do
  use Doax3.DataCase

  alias Doax3.Characters

  describe "girls" do
    alias Doax3.Characters.Girl

    @valid_attrs %{age: 42, birthday: ~D[2010-04-17], bust: 42, favorite_color: "some favorite_color", height: 42, hip: 42, hobby: "some hobby", name: "some name", nationality: "some nationality", waist: 42, weight: 42}
    @update_attrs %{age: 43, birthday: ~D[2011-05-18], bust: 43, favorite_color: "some updated favorite_color", height: 43, hip: 43, hobby: "some updated hobby", name: "some updated name", nationality: "some updated nationality", waist: 43, weight: 43}
    @invalid_attrs %{age: nil, birthday: nil, bust: nil, favorite_color: nil, height: nil, hip: nil, hobby: nil, name: nil, nationality: nil, waist: nil, weight: nil}

    def girl_fixture(attrs \\ %{}) do
      {:ok, girl} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Characters.create_girl()

      girl
    end

    test "list_girls/0 returns all girls" do
      girl = girl_fixture()
      assert Characters.list_girls() == [girl]
    end

    test "get_girl!/1 returns the girl with given id" do
      girl = girl_fixture()
      assert Characters.get_girl!(girl.id) == girl
    end

    test "create_girl/1 with valid data creates a girl" do
      assert {:ok, %Girl{} = girl} = Characters.create_girl(@valid_attrs)
      assert girl.age == 42
      assert girl.birthday == ~D[2010-04-17]
      assert girl.bust == 42
      assert girl.favorite_color == "some favorite_color"
      assert girl.height == 42
      assert girl.hip == 42
      assert girl.hobby == "some hobby"
      assert girl.name == "some name"
      assert girl.nationality == "some nationality"
      assert girl.waist == 42
      assert girl.weight == 42
    end

    test "create_girl/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characters.create_girl(@invalid_attrs)
    end

    test "update_girl/2 with valid data updates the girl" do
      girl = girl_fixture()
      assert {:ok, girl} = Characters.update_girl(girl, @update_attrs)
      assert %Girl{} = girl
      assert girl.age == 43
      assert girl.birthday == ~D[2011-05-18]
      assert girl.bust == 43
      assert girl.favorite_color == "some updated favorite_color"
      assert girl.height == 43
      assert girl.hip == 43
      assert girl.hobby == "some updated hobby"
      assert girl.name == "some updated name"
      assert girl.nationality == "some updated nationality"
      assert girl.waist == 43
      assert girl.weight == 43
    end

    test "update_girl/2 with invalid data returns error changeset" do
      girl = girl_fixture()
      assert {:error, %Ecto.Changeset{}} = Characters.update_girl(girl, @invalid_attrs)
      assert girl == Characters.get_girl!(girl.id)
    end

    test "delete_girl/1 deletes the girl" do
      girl = girl_fixture()
      assert {:ok, %Girl{}} = Characters.delete_girl(girl)
      assert_raise Ecto.NoResultsError, fn -> Characters.get_girl!(girl.id) end
    end

    test "change_girl/1 returns a girl changeset" do
      girl = girl_fixture()
      assert %Ecto.Changeset{} = Characters.change_girl(girl)
    end
  end
end
