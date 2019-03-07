defmodule ApiexampleWeb.UserView do
    use ApiexampleWeb, :view
  
    def render("user.json", %{user: user}) do
      %{
        id: user.id,
        name: user.name,
        email: user.email
      }
    end
  end