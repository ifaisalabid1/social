defmodule Social.Firms.Firm do
  use Ecto.Schema
  import Ecto.Changeset
  import EctoCommons.{PhoneNumberValidator, EmailValidator, URLValidator}

  schema "firms" do
    field :name, :string
    field :about, :string
    field :logo, :string
    field :website, :string
    field :is_featured, :boolean, default: false
    field :email, :string
    field :phone, :string

    has_many :lawyers, Social.Lawyers.Lawyer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(firm, attrs) do
    firm
    |> cast(attrs, [:name, :about, :logo, :website, :is_featured, :email, :phone])
    |> validate_required([:name, :about, :logo, :website, :is_featured, :email, :phone])
    |> validate_email(:email)
    |> validate_phone_number(:phone)
    |> validate_url(:logo)
    |> validate_url(:website)
  end
end
