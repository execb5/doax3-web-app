defmodule Doax3Web.GirlControllerTest do
  use Doax3Web.ConnCase

  alias Doax3.Characters
  alias Doax3.Characters.Girl

  @create_attrs %{age: 42, birthday: ~D[2010-04-17], bust: 42, favorite_color: "some favorite_color", height: 42, hip: 42, hobby: "some hobby", name: "some name", nationality: "some nationality", waist: 42, weight: 42}
  @update_attrs %{age: 43, birthday: ~D[2011-05-18], bust: 43, favorite_color: "some updated favorite_color", height: 43, hip: 43, hobby: "some updated hobby", name: "some updated name", nationality: "some updated nationality", waist: 43, weight: 43}
  @invalid_attrs %{age: nil, birthday: nil, bust: nil, favorite_color: nil, height: nil, hip: nil, hobby: nil, name: nil, nationality: nil, waist: nil, weight: nil}

  def fixture(:girl) do
    {:ok, girl} = Characters.create_girl(@create_attrs)
    girl
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all girls", %{conn: conn} do
      conn = get conn, girl_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create girl" do
    test "renders girl when data is valid", %{conn: conn} do
      conn = post conn, girl_path(conn, :create), girl: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, girl_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "age" => 42,
        "birthday" => "2010-04-17",
        "bust" => 42,
        "favorite_color" => "some favorite_color",
        "height" => 42,
        "hip" => 42,
        "hobby" => "some hobby",
        "name" => "some name",
        "nationality" => "some nationality",
        "waist" => 42,
        "weight" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, girl_path(conn, :create), girl: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update girl" do
    setup [:create_girl]

    test "renders girl when data is valid", %{conn: conn, girl: %Girl{id: id} = girl} do
      conn = put conn, girl_path(conn, :update, girl), girl: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, girl_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "age" => 43,
        "birthday" => "2011-05-18",
        "bust" => 43,
        "favorite_color" => "some updated favorite_color",
        "height" => 43,
        "hip" => 43,
        "hobby" => "some updated hobby",
        "name" => "some updated name",
        "nationality" => "some updated nationality",
        "waist" => 43,
        "weight" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, girl: girl} do
      conn = put conn, girl_path(conn, :update, girl), girl: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete girl" do
    setup [:create_girl]

    test "deletes chosen girl", %{conn: conn, girl: girl} do
      conn = delete conn, girl_path(conn, :delete, girl)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, girl_path(conn, :show, girl)
      end
    end
  end

  defp create_girl(_) do
    girl = fixture(:girl)
    {:ok, girl: girl}
  end
end
