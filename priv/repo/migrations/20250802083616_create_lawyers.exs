defmodule Social.Repo.Migrations.CreateLawyers do
  use Ecto.Migration

  def change do
    create table(:lawyers) do
      add :name, :string
      add :about, :text
      add :image, :string
      add :website, :string
      add :is_featured, :boolean, default: false, null: false
      add :email, :string
      add :phone, :string
      add :year_of_experience, :integer
      add :firm_id, references(:firms, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:lawyers, [:firm_id])
    create unique_index(:lawyers, [:email])
    create unique_index(:lawyers, [:phone])
  end
end
