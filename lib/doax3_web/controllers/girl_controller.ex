defmodule Doax3Web.GirlController do
  use Doax3Web, :controller

  alias Doax3.Characters
  alias Doax3.Characters.Girl

  action_fallback Doax3Web.FallbackController

  def index(conn, _params) do
    girls = Characters.list_girls()
    render(conn, "index.json", girls: girls)
  end

  def create(conn, %{"girl" => girl_params}) do
    with {:ok, %Girl{} = girl} <- Characters.create_girl(girl_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", girl_path(conn, :show, girl))
      |> render("show.json", girl: girl)
    end
  end

  def show(conn, %{"id" => id}) do
    girl = Characters.get_girl!(id)
    render(conn, "show.json", girl: girl)
  end

  def update(conn, %{"id" => id, "girl" => girl_params}) do
    girl = Characters.get_girl!(id)

    with {:ok, %Girl{} = girl} <- Characters.update_girl(girl, girl_params) do
      render(conn, "show.json", girl: girl)
    end
  end

  def delete(conn, %{"id" => id}) do
    girl = Characters.get_girl!(id)
    with {:ok, %Girl{}} <- Characters.delete_girl(girl) do
      send_resp(conn, :no_content, "")
    end
  end
end
