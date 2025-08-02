defmodule Social.Firms do
  @moduledoc """
  The Firms context.
  """

  import Ecto.Query, warn: false
  alias Social.Repo

  alias Social.Firms.Firm

  @doc """
  Returns the list of firms.

  ## Examples

      iex> list_firms()
      [%Firm{}, ...]

  """
  def list_firms do
    Repo.all(Firm)
  end

  @doc """
  Gets a single firm.

  Raises `Ecto.NoResultsError` if the Firm does not exist.

  ## Examples

      iex> get_firm!(123)
      %Firm{}

      iex> get_firm!(456)
      ** (Ecto.NoResultsError)

  """
  def get_firm!(id), do: Repo.get!(Firm, id)

  @doc """
  Creates a firm.

  ## Examples

      iex> create_firm(%{field: value})
      {:ok, %Firm{}}

      iex> create_firm(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_firm(attrs \\ %{}) do
    %Firm{}
    |> Firm.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a firm.

  ## Examples

      iex> update_firm(firm, %{field: new_value})
      {:ok, %Firm{}}

      iex> update_firm(firm, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_firm(%Firm{} = firm, attrs) do
    firm
    |> Firm.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a firm.

  ## Examples

      iex> delete_firm(firm)
      {:ok, %Firm{}}

      iex> delete_firm(firm)
      {:error, %Ecto.Changeset{}}

  """
  def delete_firm(%Firm{} = firm) do
    Repo.delete(firm)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking firm changes.

  ## Examples

      iex> change_firm(firm)
      %Ecto.Changeset{data: %Firm{}}

  """
  def change_firm(%Firm{} = firm, attrs \\ %{}) do
    Firm.changeset(firm, attrs)
  end
end
