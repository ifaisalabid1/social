defmodule SocialWeb.LawyerJSON do
  alias Social.Lawyers.Lawyer

  @doc """
  Renders a list of lawyers.
  """
  def index(%{lawyers: lawyers}) do
    %{data: for(lawyer <- lawyers, do: data(lawyer))}
  end

  @doc """
  Renders a single lawyer.
  """
  def show(%{lawyer: lawyer}) do
    %{data: data(lawyer)}
  end

  defp data(%Lawyer{} = lawyer) do
    %{
      id: lawyer.id,
      name: lawyer.name,
      about: lawyer.about,
      image: lawyer.image,
      website: lawyer.website,
      is_featured: lawyer.is_featured,
      email: lawyer.email,
      phone: lawyer.phone,
      year_of_experience: lawyer.year_of_experience,
      firm: lawyer.firm && lawyer.firm.name
    }
  end
end
