defmodule Social.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Social.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        about: "some about",
        name: "some name"
      })
      |> Social.Users.create_user()

    user
  end
end
