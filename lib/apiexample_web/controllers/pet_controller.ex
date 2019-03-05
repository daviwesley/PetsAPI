defmodule ApiexampleWeb.PetController do
  use ApiexampleWeb, :controller

  alias Apiexample.Animal
  alias Apiexample.Animal.Pet

  action_fallback ApiexampleWeb.FallbackController

  def index(conn, _params) do
    pets = Animal.list_pets()
    render(conn, "index.json-api", data: pets)
  end

  def create(conn, %{"pet" => pet_params}) do
    with {:ok, %Pet{} = pet} <- Animal.create_pet(pet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.pet_path(conn, :show, pet))
      |> render("show.json-api", pet: pet)
    end
  end

  def show(conn, %{"id" => id}) do
    pet = Animal.get_pet!(id)
    render(conn, "show.json-api", data: pet)
  end

  def update(conn, %{"id" => id, "pet" => pet_params}) do
    pet = Animal.get_pet!(id)

    with {:ok, %Pet{} = pet} <- Animal.update_pet(pet, pet_params) do
      render(conn, "show.json-api", pet: pet)
    end
  end

  def delete(conn, %{"id" => id}) do
    pet = Animal.get_pet!(id)

    with {:ok, %Pet{}} <- Animal.delete_pet(pet) do
      send_resp(conn, :no_content, "")
    end
  end
end
