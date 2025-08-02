# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Social.Repo.insert!(%Social.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

lawyers = [
  %{
    name: "Lawyer1",
    about: "About lawyer 1",
    image: "https://picsum.photos/200",
    website: "https://picsum.photos/200/300",
    is_featured: true,
    email: "lawyer1@gmail.com",
    phone: "+917278671452",
    year_of_experience: 3,
    firm_id: 1
  }
]

for lawyer <- lawyers do
  Social.Lawyers.create_lawyer(lawyer)
end
