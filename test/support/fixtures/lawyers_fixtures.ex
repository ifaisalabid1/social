defmodule Social.LawyersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Social.Lawyers` context.
  """

  @doc """
  Generate a lawyer.
  """
  def lawyer_fixture(attrs \\ %{}) do
    {:ok, lawyer} =
      attrs
      |> Enum.into(%{
        about: "some about",
        email: "some email",
        image: "some image",
        is_featured: true,
        name: "some name",
        phone: "some phone",
        website: "some website",
        year_of_experience: 42
      })
      |> Social.Lawyers.create_lawyer()

    lawyer
  end
end
