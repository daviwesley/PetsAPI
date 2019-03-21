# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Apiexample.Repo.insert!(%Apiexample.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
user =
  Apiexample.Accounts.User.registration_changeset(%Apiexample.Accounts.User{}, %{
    name: "davi",
    email: "davi.wesley@icloud.com",
    password: "issodeveriaserumsegredo"
  })

pet = Apiexample.Animal.Pet.changeset(%Apiexample.Animal.Pet{}, %{
 race: "Bombay",
 average_life_time: 20,
 average_height: 8,
 allergies: "sinus, gingivitis",
 nacionality: "USA and Thailand",
 hair_color: "black",
 eye_color: "copper or green",
 image: "https://i1.wp.com/petradioshow.com/wp-content/uploads/2017/10/bombay.jpg?resize=572%2C434"
 })

Apiexample.Repo.insert!(user)
Apiexample.Repo.insert!(pet)
