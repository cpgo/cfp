defmodule CfpWeb.Router do
  use CfpWeb, :router

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

  scope "/", CfpWeb do
    pipe_through :browser

    get "/", PublicController, :index
    resources "/slack", SlackController, only: [:index, :create, :new]

    
  end

end
