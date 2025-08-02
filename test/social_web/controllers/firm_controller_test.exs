defmodule SocialWeb.FirmControllerTest do
  use SocialWeb.ConnCase

  import Social.FirmsFixtures

  alias Social.Firms.Firm

  @create_attrs %{
    name: "some name",
    about: "some about",
    logo: "some logo",
    website: "some website",
    is_featured: true,
    email: "some email",
    phone: "some phone"
  }
  @update_attrs %{
    name: "some updated name",
    about: "some updated about",
    logo: "some updated logo",
    website: "some updated website",
    is_featured: false,
    email: "some updated email",
    phone: "some updated phone"
  }
  @invalid_attrs %{name: nil, about: nil, logo: nil, website: nil, is_featured: nil, email: nil, phone: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all firms", %{conn: conn} do
      conn = get(conn, ~p"/api/firms")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create firm" do
    test "renders firm when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/firms", firm: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/firms/#{id}")

      assert %{
               "id" => ^id,
               "about" => "some about",
               "email" => "some email",
               "is_featured" => true,
               "logo" => "some logo",
               "name" => "some name",
               "phone" => "some phone",
               "website" => "some website"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/firms", firm: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update firm" do
    setup [:create_firm]

    test "renders firm when data is valid", %{conn: conn, firm: %Firm{id: id} = firm} do
      conn = put(conn, ~p"/api/firms/#{firm}", firm: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/firms/#{id}")

      assert %{
               "id" => ^id,
               "about" => "some updated about",
               "email" => "some updated email",
               "is_featured" => false,
               "logo" => "some updated logo",
               "name" => "some updated name",
               "phone" => "some updated phone",
               "website" => "some updated website"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, firm: firm} do
      conn = put(conn, ~p"/api/firms/#{firm}", firm: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete firm" do
    setup [:create_firm]

    test "deletes chosen firm", %{conn: conn, firm: firm} do
      conn = delete(conn, ~p"/api/firms/#{firm}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/firms/#{firm}")
      end
    end
  end

  defp create_firm(_) do
    firm = firm_fixture()
    %{firm: firm}
  end
end
