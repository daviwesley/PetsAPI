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

Apiexample.Repo.insert!(user)
