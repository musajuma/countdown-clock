defmodule CountdownWeb.Router do
  use CountdownWeb, :router

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

  scope "/", CountdownWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/events", EventController

  end

  # Other scopes may use custom stacks.
  # scope "/api", CountdownWeb do
  #   pipe_through :api
  # end
end
