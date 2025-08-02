defmodule Social.LawyersTest do
  use Social.DataCase

  alias Social.Lawyers

  describe "lawyers" do
    alias Social.Lawyers.Lawyer

    import Social.LawyersFixtures

    @invalid_attrs %{name: nil, image: nil, about: nil, website: nil, is_featured: nil, email: nil, phone: nil, year_of_experience: nil}

    test "list_lawyers/0 returns all lawyers" do
      lawyer = lawyer_fixture()
      assert Lawyers.list_lawyers() == [lawyer]
    end

    test "get_lawyer!/1 returns the lawyer with given id" do
      lawyer = lawyer_fixture()
      assert Lawyers.get_lawyer!(lawyer.id) == lawyer
    end

    test "create_lawyer/1 with valid data creates a lawyer" do
      valid_attrs = %{name: "some name", image: "some image", about: "some about", website: "some website", is_featured: true, email: "some email", phone: "some phone", year_of_experience: 42}

      assert {:ok, %Lawyer{} = lawyer} = Lawyers.create_lawyer(valid_attrs)
      assert lawyer.name == "some name"
      assert lawyer.image == "some image"
      assert lawyer.about == "some about"
      assert lawyer.website == "some website"
      assert lawyer.is_featured == true
      assert lawyer.email == "some email"
      assert lawyer.phone == "some phone"
      assert lawyer.year_of_experience == 42
    end

    test "create_lawyer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lawyers.create_lawyer(@invalid_attrs)
    end

    test "update_lawyer/2 with valid data updates the lawyer" do
      lawyer = lawyer_fixture()
      update_attrs = %{name: "some updated name", image: "some updated image", about: "some updated about", website: "some updated website", is_featured: false, email: "some updated email", phone: "some updated phone", year_of_experience: 43}

      assert {:ok, %Lawyer{} = lawyer} = Lawyers.update_lawyer(lawyer, update_attrs)
      assert lawyer.name == "some updated name"
      assert lawyer.image == "some updated image"
      assert lawyer.about == "some updated about"
      assert lawyer.website == "some updated website"
      assert lawyer.is_featured == false
      assert lawyer.email == "some updated email"
      assert lawyer.phone == "some updated phone"
      assert lawyer.year_of_experience == 43
    end

    test "update_lawyer/2 with invalid data returns error changeset" do
      lawyer = lawyer_fixture()
      assert {:error, %Ecto.Changeset{}} = Lawyers.update_lawyer(lawyer, @invalid_attrs)
      assert lawyer == Lawyers.get_lawyer!(lawyer.id)
    end

    test "delete_lawyer/1 deletes the lawyer" do
      lawyer = lawyer_fixture()
      assert {:ok, %Lawyer{}} = Lawyers.delete_lawyer(lawyer)
      assert_raise Ecto.NoResultsError, fn -> Lawyers.get_lawyer!(lawyer.id) end
    end

    test "change_lawyer/1 returns a lawyer changeset" do
      lawyer = lawyer_fixture()
      assert %Ecto.Changeset{} = Lawyers.change_lawyer(lawyer)
    end
  end
end
