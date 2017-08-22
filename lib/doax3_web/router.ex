defmodule Doax3Web.Router do
  use Doax3Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Doax3Web do
    pipe_through :api

    resources "/girls", GirlController, except: [:new, :edit]
  end
end
