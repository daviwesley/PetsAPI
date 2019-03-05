defmodule Apiexample.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :race, :string
      add :nacionality, :string
      add :eye_color, :string
      add :hair_color, :string
      add :average_life_time, :integer
      add :average_height, :integer
      add :allergies, :string
      add :image, :string

      timestamps()
    end

  end
end
