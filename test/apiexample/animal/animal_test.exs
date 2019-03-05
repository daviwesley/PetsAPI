defmodule Apiexample.AnimalTest do
  use Apiexample.DataCase

  alias Apiexample.Animal

  describe "pets" do
    alias Apiexample.Animal.Pet

    @valid_attrs %{allergies: "some allergies", average_height: 42, average_life_time: 42, eye_color: "some eye_color", hair_color: "some hair_color", image: "some image", nacionality: "some nacionality", race: "some race"}
    @update_attrs %{allergies: "some updated allergies", average_height: 43, average_life_time: 43, eye_color: "some updated eye_color", hair_color: "some updated hair_color", image: "some updated image", nacionality: "some updated nacionality", race: "some updated race"}
    @invalid_attrs %{allergies: nil, average_height: nil, average_life_time: nil, eye_color: nil, hair_color: nil, image: nil, nacionality: nil, race: nil}

    def pet_fixture(attrs \\ %{}) do
      {:ok, pet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Animal.create_pet()

      pet
    end

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Animal.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Animal.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      assert {:ok, %Pet{} = pet} = Animal.create_pet(@valid_attrs)
      assert pet.allergies == "some allergies"
      assert pet.average_height == 42
      assert pet.average_life_time == 42
      assert pet.eye_color == "some eye_color"
      assert pet.hair_color == "some hair_color"
      assert pet.image == "some image"
      assert pet.nacionality == "some nacionality"
      assert pet.race == "some race"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Animal.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{} = pet} = Animal.update_pet(pet, @update_attrs)
      assert pet.allergies == "some updated allergies"
      assert pet.average_height == 43
      assert pet.average_life_time == 43
      assert pet.eye_color == "some updated eye_color"
      assert pet.hair_color == "some updated hair_color"
      assert pet.image == "some updated image"
      assert pet.nacionality == "some updated nacionality"
      assert pet.race == "some updated race"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Animal.update_pet(pet, @invalid_attrs)
      assert pet == Animal.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Animal.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Animal.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Animal.change_pet(pet)
    end
  end
end
