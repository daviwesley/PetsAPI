defmodule ApiexampleWeb.PetControllerTest do
  use ApiexampleWeb.ConnCase

  alias Apiexample.Animal
  alias Apiexample.Animal.Pet

  @create_attrs %{
    allergies: "some allergies",
    average_height: 42,
    average_life_time: 42,
    eye_color: "some eye_color",
    hair_color: "some hair_color",
    image: "some image",
    nacionality: "some nacionality",
    race: "some race"
  }
  @update_attrs %{
    allergies: "some updated allergies",
    average_height: 43,
    average_life_time: 43,
    eye_color: "some updated eye_color",
    hair_color: "some updated hair_color",
    image: "some updated image",
    nacionality: "some updated nacionality",
    race: "some updated race"
  }
  @invalid_attrs %{allergies: nil, average_height: nil, average_life_time: nil, eye_color: nil, hair_color: nil, image: nil, nacionality: nil, race: nil}

  def fixture(:pet) do
    {:ok, pet} = Animal.create_pet(@create_attrs)
    pet
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pets", %{conn: conn} do
      conn = get(conn, Routes.pet_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pet" do
    test "renders pet when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pet_path(conn, :create), pet: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.pet_path(conn, :show, id))

      assert %{
               "id" => id,
               "allergies" => "some allergies",
               "average_height" => 42,
               "average_life_time" => 42,
               "eye_color" => "some eye_color",
               "hair_color" => "some hair_color",
               "image" => "some image",
               "nacionality" => "some nacionality",
               "race" => "some race"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pet_path(conn, :create), pet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pet" do
    setup [:create_pet]

    test "renders pet when data is valid", %{conn: conn, pet: %Pet{id: id} = pet} do
      conn = put(conn, Routes.pet_path(conn, :update, pet), pet: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.pet_path(conn, :show, id))

      assert %{
               "id" => id,
               "allergies" => "some updated allergies",
               "average_height" => 43,
               "average_life_time" => 43,
               "eye_color" => "some updated eye_color",
               "hair_color" => "some updated hair_color",
               "image" => "some updated image",
               "nacionality" => "some updated nacionality",
               "race" => "some updated race"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pet: pet} do
      conn = put(conn, Routes.pet_path(conn, :update, pet), pet: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pet" do
    setup [:create_pet]

    test "deletes chosen pet", %{conn: conn, pet: pet} do
      conn = delete(conn, Routes.pet_path(conn, :delete, pet))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.pet_path(conn, :show, pet))
      end
    end
  end

  defp create_pet(_) do
    pet = fixture(:pet)
    {:ok, pet: pet}
  end
end
