defmodule Crm.DevicesTest do
  use Crm.DataCase

  alias Crm.Devices

  describe "devices" do
    alias Crm.Devices.Device

    import Crm.DevicesFixtures

    @invalid_attrs %{serialno: nil, brand: nil, model: nil, currentlocation: nil, remarks: nil}

    test "list_devices/0 returns all devices" do
      device = device_fixture()
      assert Devices.list_devices() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device = device_fixture()
      assert Devices.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      valid_attrs = %{serialno: "some serialno", brand: "some brand", model: "some model", currentlocation: "some currentlocation", remarks: "some remarks"}

      assert {:ok, %Device{} = device} = Devices.create_device(valid_attrs)
      assert device.serialno == "some serialno"
      assert device.brand == "some brand"
      assert device.model == "some model"
      assert device.currentlocation == "some currentlocation"
      assert device.remarks == "some remarks"
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Devices.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device = device_fixture()
      update_attrs = %{serialno: "some updated serialno", brand: "some updated brand", model: "some updated model", currentlocation: "some updated currentlocation", remarks: "some updated remarks"}

      assert {:ok, %Device{} = device} = Devices.update_device(device, update_attrs)
      assert device.serialno == "some updated serialno"
      assert device.brand == "some updated brand"
      assert device.model == "some updated model"
      assert device.currentlocation == "some updated currentlocation"
      assert device.remarks == "some updated remarks"
    end

    test "update_device/2 with invalid data returns error changeset" do
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = Devices.update_device(device, @invalid_attrs)
      assert device == Devices.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device = device_fixture()
      assert {:ok, %Device{}} = Devices.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> Devices.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device = device_fixture()
      assert %Ecto.Changeset{} = Devices.change_device(device)
    end
  end
end
