defmodule Crm.DevicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crm.Devices` context.
  """

  @doc """
  Generate a device.
  """
  def device_fixture(attrs \\ %{}) do
    {:ok, device} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        currentlocation: "some currentlocation",
        model: "some model",
        remarks: "some remarks",
        serialno: "some serialno"
      })
      |> Crm.Devices.create_device()

    device
  end
end
