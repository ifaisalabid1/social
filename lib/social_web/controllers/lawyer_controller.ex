defmodule SocialWeb.LawyerController do
  use SocialWeb, :controller

  alias Social.Lawyers
  alias Social.Lawyers.Lawyer

  action_fallback SocialWeb.FallbackController

  def index(conn, _params) do
    lawyers = Lawyers.list_lawyers()
    render(conn, :index, lawyers: lawyers)
  end

  def create(conn, %{"lawyer" => lawyer_params}) do
    with {:ok, %Lawyer{} = lawyer} <- Lawyers.create_lawyer(lawyer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/lawyers/#{lawyer}")
      |> render(:show, lawyer: lawyer)
    end
  end

  def show(conn, %{"id" => id}) do
    lawyer = Lawyers.get_lawyer!(id)
    render(conn, :show, lawyer: lawyer)
  end

  def update(conn, %{"id" => id, "lawyer" => lawyer_params}) do
    lawyer = Lawyers.get_lawyer!(id)

    with {:ok, %Lawyer{} = lawyer} <- Lawyers.update_lawyer(lawyer, lawyer_params) do
      render(conn, :show, lawyer: lawyer)
    end
  end

  def delete(conn, %{"id" => id}) do
    lawyer = Lawyers.get_lawyer!(id)

    with {:ok, %Lawyer{}} <- Lawyers.delete_lawyer(lawyer) do
      send_resp(conn, :no_content, "")
    end
  end
end
