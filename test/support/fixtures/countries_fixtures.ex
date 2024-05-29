defmodule Crm.CountriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crm.Countries` context.
  """

  @doc """
  Generate a country.
  """
  def country_fixture(attrs \\ %{}) do
    {:ok, country} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Crm.Countries.create_country()

    country
  end
end
