defmodule SocialWeb.FirmController do
  use SocialWeb, :controller

  alias Social.Firms
  alias Social.Firms.Firm

  action_fallback SocialWeb.FallbackController

  def index(conn, _params) do
    firms = Firms.list_firms()
    render(conn, :index, firms: firms)
  end

  def create(conn, %{"firm" => firm_params}) do
    with {:ok, %Firm{} = firm} <- Firms.create_firm(firm_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/law-firms/#{firm}")
      |> render(:show, firm: firm)
    end
  end

  def show(conn, %{"id" => id}) do
    firm = Firms.get_firm!(id)
    render(conn, :show, firm: firm)
  end

  def update(conn, %{"id" => id, "firm" => firm_params}) do
    firm = Firms.get_firm!(id)

    with {:ok, %Firm{} = firm} <- Firms.update_firm(firm, firm_params) do
      render(conn, :show, firm: firm)
    end
  end

  def delete(conn, %{"id" => id}) do
    firm = Firms.get_firm!(id)

    with {:ok, %Firm{}} <- Firms.delete_firm(firm) do
      send_resp(conn, :no_content, "")
    end
  end
end
