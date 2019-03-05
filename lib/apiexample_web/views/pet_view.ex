defmodule ApiexampleWeb.PetView do
  use ApiexampleWeb, :view
  use JaSerializer.PhoenixView

  attributes [:race, :nacionality, :image, :average_life_time, :average_height, :eye_color,
              :hair_color, :allergies
]
end
