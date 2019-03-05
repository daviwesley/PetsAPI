defmodule ApiexampleWeb.Router do
  use ApiexampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["api"]
  end

  pipeline :api_json do
    plug :accepts, ["json-api"]
    #plug JaSerializer.Serializer
  end

  scope "/", ApiexampleWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", ApiexampleWeb do
     pipe_through :api
     resources "/pets", PetController, except: [:new, :edit]
   end
end
