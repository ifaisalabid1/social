defmodule Social.FirmsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Social.Firms` context.
  """

  @doc """
  Generate a firm.
  """
  def firm_fixture(attrs \\ %{}) do
    {:ok, firm} =
      attrs
      |> Enum.into(%{
        about: "some about",
        email: "some email",
        is_featured: true,
        logo: "some logo",
        name: "some name",
        phone: "some phone",
        website: "some website"
      })
      |> Social.Firms.create_firm()

    firm
  end
end
