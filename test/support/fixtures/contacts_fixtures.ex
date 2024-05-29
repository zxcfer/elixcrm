defmodule Crm.ContactsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crm.Contacts` context.
  """

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        email: "some email",
        location: "some location",
        mobileno: "some mobileno",
        name: "some name",
        officeno: "some officeno"
      })
      |> Crm.Contacts.create_contact()

    contact
  end
end
