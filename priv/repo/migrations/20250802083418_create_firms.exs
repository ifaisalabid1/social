defmodule Social.Repo.Migrations.CreateFirms do
  use Ecto.Migration

  def change do
    create table(:firms) do
      add :name, :string
      add :about, :text
      add :logo, :string
      add :website, :string
      add :is_featured, :boolean, default: false, null: false
      add :email, :string
      add :phone, :string

      timestamps(type: :utc_datetime)
    end
  end
end
