defmodule CfpWeb.Router do
  use CfpWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :visitor do
    plug CfpWeb.Plugs.EnsureNotAuthenticated
  end

  pipeline :user do
    plug CfpWeb.Plugs.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Public tasks
  scope "/", CfpWeb do
    pipe_through [:browser]
    
    resources "/slack", SlackController, only: [:index, :create, :new]
  end

  # Unconnected tasks
  scope "/public", CfpWeb do
    pipe_through [:browser, :visitor]
    
    get "/", PublicController, :index
  end

  # Unconnected tasks
  scope "/auth", CfpWeb do
    pipe_through [:browser, :visitor]
    
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  scope "/private", CfpWeb do
    pipe_through [:browser, :user]
    
    get "/", GlobalController, :index
    delete "/signout", AuthController, :delete
  end

end
