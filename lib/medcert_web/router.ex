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
    resources "/doctor_types", DoctorTypeController
    resources "/doctors", DoctorController
    resources "/conditions", ConditionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MedcertWeb do
  #   pipe_through :api
  # end
end
