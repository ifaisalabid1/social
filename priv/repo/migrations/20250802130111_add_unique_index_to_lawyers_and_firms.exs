defmodule Social.Repo.Migrations.AddUniqueIndexToLawyersAndFirms do
  use Ecto.Migration

  def change do
    create unique_index(:firms, [:email])
    create unique_index(:firms, [:phone])
    create unique_index(:lawyers, [:email])
    create unique_index(:lawyers, [:phone])
  end
end
