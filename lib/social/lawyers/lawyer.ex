defmodule Social.Lawyers.Lawyer do
  use Ecto.Schema
  import Ecto.Changeset
  import EctoCommons.{PhoneNumberValidator, EmailValidator, URLValidator}

  schema "lawyers" do
    field :name, :string
    field :image, :string
    field :about, :string
    field :website, :string
    field :is_featured, :boolean, default: false
    field :email, :string
    field :phone, :string
    field :year_of_experience, :integer

    belongs_to :firm, Social.Firms.Firm

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(lawyer, attrs) do
    lawyer
    |> cast(attrs, [
      :name,
      :about,
      :image,
      :website,
      :is_featured,
      :email,
      :phone,
      :year_of_experience
    ])
    |> validate_required([
      :name,
      :about,
      :image,
      :website,
      :is_featured,
      :email,
      :phone,
      :year_of_experience
    ])
    |> validate_email(:email)
    |> validate_phone_number(:phone)
    |> validate_url(:image)
    |> validate_url(:website)
    |> unique_constraint(:email)
    |> unique_constraint(:phone)
    |> validate_number(:year_of_experience,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 50
    )
  end
end
