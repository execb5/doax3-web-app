defmodule Doax3WebApp.PageController do
  use Doax3WebApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
