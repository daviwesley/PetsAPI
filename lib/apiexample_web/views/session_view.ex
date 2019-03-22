defmodule ApiexampleWeb.SessionView do
    use ApiexampleWeb, :view

    def render("show.json", %{user: user, jwt: jwt}) do
      %{
        data: render_one(user, ApiexampleWeb.UserView, "user.json"),
        meta: %{token: jwt}
      }
    end

    def render("delete.json", _) do
      %{ok: true}
    end

    def render("error.json", %{error: error}) do
      %{errors: %{error: error}}
    end
  end
