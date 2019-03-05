defmodule Apiexample.Animal.Pet do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pets" do
    field :allergies, :string
    field :average_height, :integer
    field :average_life_time, :integer
    field :eye_color, :string
    field :hair_color, :string
    field :image, :string
    field :nacionality, :string
    field :race, :string

    timestamps()
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:race, :nacionality, :eye_color, :hair_color, :average_life_time, :average_height, :allergies, :image])
    |> validate_required([:race, :nacionality, :eye_color, :hair_color, :average_life_time, :average_height, :allergies, :image])
  end
end
