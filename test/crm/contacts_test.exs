defmodule Crm.ContactsTest do
  use Crm.DataCase

  alias Crm.Contacts

  describe "contacts" do
    alias Crm.Contacts.Contact

    import Crm.ContactsFixtures

    @invalid_attrs %{name: nil, location: nil, email: nil, mobileno: nil, officeno: nil}

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Contacts.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Contacts.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      valid_attrs = %{name: "some name", location: "some location", email: "some email", mobileno: "some mobileno", officeno: "some officeno"}

      assert {:ok, %Contact{} = contact} = Contacts.create_contact(valid_attrs)
      assert contact.name == "some name"
      assert contact.location == "some location"
      assert contact.email == "some email"
      assert contact.mobileno == "some mobileno"
      assert contact.officeno == "some officeno"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      update_attrs = %{name: "some updated name", location: "some updated location", email: "some updated email", mobileno: "some updated mobileno", officeno: "some updated officeno"}

      assert {:ok, %Contact{} = contact} = Contacts.update_contact(contact, update_attrs)
      assert contact.name == "some updated name"
      assert contact.location == "some updated location"
      assert contact.email == "some updated email"
      assert contact.mobileno == "some updated mobileno"
      assert contact.officeno == "some updated officeno"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_contact(contact, @invalid_attrs)
      assert contact == Contacts.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Contacts.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact(contact)
    end
  end
end
