defmodule Social.FirmsTest do
  use Social.DataCase

  alias Social.Firms

  describe "firms" do
    alias Social.Firms.Firm

    import Social.FirmsFixtures

    @invalid_attrs %{name: nil, about: nil, logo: nil, website: nil, is_featured: nil, email: nil, phone: nil}

    test "list_firms/0 returns all firms" do
      firm = firm_fixture()
      assert Firms.list_firms() == [firm]
    end

    test "get_firm!/1 returns the firm with given id" do
      firm = firm_fixture()
      assert Firms.get_firm!(firm.id) == firm
    end

    test "create_firm/1 with valid data creates a firm" do
      valid_attrs = %{name: "some name", about: "some about", logo: "some logo", website: "some website", is_featured: true, email: "some email", phone: "some phone"}

      assert {:ok, %Firm{} = firm} = Firms.create_firm(valid_attrs)
      assert firm.name == "some name"
      assert firm.about == "some about"
      assert firm.logo == "some logo"
      assert firm.website == "some website"
      assert firm.is_featured == true
      assert firm.email == "some email"
      assert firm.phone == "some phone"
    end

    test "create_firm/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Firms.create_firm(@invalid_attrs)
    end

    test "update_firm/2 with valid data updates the firm" do
      firm = firm_fixture()
      update_attrs = %{name: "some updated name", about: "some updated about", logo: "some updated logo", website: "some updated website", is_featured: false, email: "some updated email", phone: "some updated phone"}

      assert {:ok, %Firm{} = firm} = Firms.update_firm(firm, update_attrs)
      assert firm.name == "some updated name"
      assert firm.about == "some updated about"
      assert firm.logo == "some updated logo"
      assert firm.website == "some updated website"
      assert firm.is_featured == false
      assert firm.email == "some updated email"
      assert firm.phone == "some updated phone"
    end

    test "update_firm/2 with invalid data returns error changeset" do
      firm = firm_fixture()
      assert {:error, %Ecto.Changeset{}} = Firms.update_firm(firm, @invalid_attrs)
      assert firm == Firms.get_firm!(firm.id)
    end

    test "delete_firm/1 deletes the firm" do
      firm = firm_fixture()
      assert {:ok, %Firm{}} = Firms.delete_firm(firm)
      assert_raise Ecto.NoResultsError, fn -> Firms.get_firm!(firm.id) end
    end

    test "change_firm/1 returns a firm changeset" do
      firm = firm_fixture()
      assert %Ecto.Changeset{} = Firms.change_firm(firm)
    end
  end
end
