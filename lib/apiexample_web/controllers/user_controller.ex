defmodule ApiexampleWeb.UserController do
    use ApiexampleWeb, :controller
  
    alias Apiexample.Accounts
    alias Apiexample.Accounts.User
    alias Apiexample.Auth.Guardian
  
    action_fallback(ApiexampleWeb.FallbackController)
  
    def create(conn, params) do
      with {:ok, %User{} = user} <- Accounts.create_user(params) do
        new_conn = Guardian.Plug.sign_in(conn, user)
        jwt = Guardian.Plug.current_token(new_conn)
  
        new_conn
        |> put_status(:created)
        |> render(ApiexampleWeb.SessionView, "show.json", user: user, jwt: jwt)
      end
    end
  end