defmodule SocialWeb.FirmJSON do
  alias Social.Firms.Firm

  @doc """
  Renders a list of firms.
  """
  def index(%{firms: firms}) do
    %{data: for(firm <- firms, do: data(firm))}
  end

  @doc """
  Renders a single firm.
  """
  def show(%{firm: firm}) do
    %{data: data(firm)}
  end

  defp data(%Firm{} = firm) do
    %{
      id: firm.id,
      name: firm.name,
      about: firm.about,
      logo: firm.logo,
      website: firm.website,
      is_featured: firm.is_featured,
      email: firm.email,
      phone: firm.phone
    }
  end
end
