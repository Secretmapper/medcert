defmodule MedcertWeb.Router do
  use MedcertWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MedcertWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/doctor_types", DoctorTypeController, :index
    get "/doctor_types/:id", DoctorTypeController, :show

    get "/conditions", ConditionController, :index
    get "/conditions/:id", ConditionController, :show

    resources "/doctors", DoctorController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MedcertWeb do
  #   pipe_through :api
  # end
end
