defmodule Crm.ContractsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crm.Contracts` context.
  """

  @doc """
  Generate a contract.
  """
  def contract_fixture(attrs \\ %{}) do
    {:ok, contract} =
      attrs
      |> Enum.into(%{
        active: true,
        do: "some do",
        enddate: ~D[2024-05-22],
        itq: "some itq",
        po: "some po",
        startdate: ~D[2024-05-22],
        svcalloperdevice: 42,
        timeallo: 42,
        type: "some type",
        value: 120.5
      })
      |> Crm.Contracts.create_contract()

    contract
  end
end
