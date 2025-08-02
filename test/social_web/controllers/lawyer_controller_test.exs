defmodule SocialWeb.LawyerControllerTest do
  use SocialWeb.ConnCase

  import Social.LawyersFixtures

  alias Social.Lawyers.Lawyer

  @create_attrs %{
    name: "some name",
    image: "some image",
    about: "some about",
    website: "some website",
    is_featured: true,
    email: "some email",
    phone: "some phone",
    year_of_experience: 42
  }
  @update_attrs %{
    name: "some updated name",
    image: "some updated image",
    about: "some updated about",
    website: "some updated website",
    is_featured: false,
    email: "some updated email",
    phone: "some updated phone",
    year_of_experience: 43
  }
  @invalid_attrs %{name: nil, image: nil, about: nil, website: nil, is_featured: nil, email: nil, phone: nil, year_of_experience: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all lawyers", %{conn: conn} do
      conn = get(conn, ~p"/api/lawyers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create lawyer" do
    test "renders lawyer when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/lawyers", lawyer: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/lawyers/#{id}")

      assert %{
               "id" => ^id,
               "about" => "some about",
               "email" => "some email",
               "image" => "some image",
               "is_featured" => true,
               "name" => "some name",
               "phone" => "some phone",
               "website" => "some website",
               "year_of_experience" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/lawyers", lawyer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update lawyer" do
    setup [:create_lawyer]

    test "renders lawyer when data is valid", %{conn: conn, lawyer: %Lawyer{id: id} = lawyer} do
      conn = put(conn, ~p"/api/lawyers/#{lawyer}", lawyer: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/lawyers/#{id}")

      assert %{
               "id" => ^id,
               "about" => "some updated about",
               "email" => "some updated email",
               "image" => "some updated image",
               "is_featured" => false,
               "name" => "some updated name",
               "phone" => "some updated phone",
               "website" => "some updated website",
               "year_of_experience" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, lawyer: lawyer} do
      conn = put(conn, ~p"/api/lawyers/#{lawyer}", lawyer: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete lawyer" do
    setup [:create_lawyer]

    test "deletes chosen lawyer", %{conn: conn, lawyer: lawyer} do
      conn = delete(conn, ~p"/api/lawyers/#{lawyer}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/lawyers/#{lawyer}")
      end
    end
  end

  defp create_lawyer(_) do
    lawyer = lawyer_fixture()
    %{lawyer: lawyer}
  end
end
