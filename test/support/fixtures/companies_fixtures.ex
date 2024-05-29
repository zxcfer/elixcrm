defmodule Crm.CompaniesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crm.Companies` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        billingadd1: "some billingadd1",
        billingadd2: "some billingadd2",
        name: "some name",
        postalcode: "some postalcode"
      })
      |> Crm.Companies.create_company()

    company
  end
end
