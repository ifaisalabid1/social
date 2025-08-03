defmodule Social.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset
  import EctoCommons.EmailValidator

  schema "accounts" do
    field :hash_password, :string
    field :email, :string

    has_one :user, Social.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :hash_password])
    |> validate_required([:email, :hash_password])
    |> validate_email(:email)
    |> unique_constraint(:email)
  end
end
