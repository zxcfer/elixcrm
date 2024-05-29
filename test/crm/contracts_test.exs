defmodule Crm.ContractsTest do
  use Crm.DataCase

  alias Crm.Contracts

  describe "contracts" do
    alias Crm.Contracts.Contract

    import Crm.ContractsFixtures

    @invalid_attrs %{type: nil, value: nil, do: nil, po: nil, itq: nil, startdate: nil, enddate: nil, svcalloperdevice: nil, timeallo: nil}

    test "list_contracts/0 returns all contracts" do
      contract = contract_fixture()
      assert Contracts.list_contracts() == [contract]
    end

    test "get_contract!/1 returns the contract with given id" do
      contract = contract_fixture()
      assert Contracts.get_contract!(contract.id) == contract
    end

    test "create_contract/1 with valid data creates a contract" do
      valid_attrs = %{type: "some type", value: 120.5, do: "some do", po: "some po", itq: "some itq", startdate: ~D[2024-05-22], enddate: ~D[2024-05-22], svcalloperdevice: 42, timeallo: 42}

      assert {:ok, %Contract{} = contract} = Contracts.create_contract(valid_attrs)
      assert contract.type == "some type"
      assert contract.value == 120.5
      assert contract.do == "some do"
      assert contract.po == "some po"
      assert contract.itq == "some itq"
      assert contract.startdate == ~D[2024-05-22]
      assert contract.enddate == ~D[2024-05-22]
      assert contract.svcalloperdevice == 42
      assert contract.timeallo == 42
    end

    test "create_contract/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contracts.create_contract(@invalid_attrs)
    end

    test "update_contract/2 with valid data updates the contract" do
      contract = contract_fixture()
      update_attrs = %{type: "some updated type", value: 456.7, do: "some updated do", po: "some updated po", itq: "some updated itq", startdate: ~D[2024-05-23], enddate: ~D[2024-05-23], svcalloperdevice: 43, timeallo: 43}

      assert {:ok, %Contract{} = contract} = Contracts.update_contract(contract, update_attrs)
      assert contract.type == "some updated type"
      assert contract.value == 456.7
      assert contract.do == "some updated do"
      assert contract.po == "some updated po"
      assert contract.itq == "some updated itq"
      assert contract.startdate == ~D[2024-05-23]
      assert contract.enddate == ~D[2024-05-23]
      assert contract.svcalloperdevice == 43
      assert contract.timeallo == 43
    end

    test "update_contract/2 with invalid data returns error changeset" do
      contract = contract_fixture()
      assert {:error, %Ecto.Changeset{}} = Contracts.update_contract(contract, @invalid_attrs)
      assert contract == Contracts.get_contract!(contract.id)
    end

    test "delete_contract/1 deletes the contract" do
      contract = contract_fixture()
      assert {:ok, %Contract{}} = Contracts.delete_contract(contract)
      assert_raise Ecto.NoResultsError, fn -> Contracts.get_contract!(contract.id) end
    end

    test "change_contract/1 returns a contract changeset" do
      contract = contract_fixture()
      assert %Ecto.Changeset{} = Contracts.change_contract(contract)
    end
  end

  describe "contracts" do
    alias Crm.Contracts.Contract

    import Crm.ContractsFixtures

    @invalid_attrs %{active: nil, type: nil, value: nil, do: nil, po: nil, itq: nil, startdate: nil, enddate: nil, svcalloperdevice: nil, timeallo: nil}

    test "list_contracts/0 returns all contracts" do
      contract = contract_fixture()
      assert Contracts.list_contracts() == [contract]
    end

    test "get_contract!/1 returns the contract with given id" do
      contract = contract_fixture()
      assert Contracts.get_contract!(contract.id) == contract
    end

    test "create_contract/1 with valid data creates a contract" do
      valid_attrs = %{active: true, type: "some type", value: 120.5, do: "some do", po: "some po", itq: "some itq", startdate: ~D[2024-05-22], enddate: ~D[2024-05-22], svcalloperdevice: 42, timeallo: 42}

      assert {:ok, %Contract{} = contract} = Contracts.create_contract(valid_attrs)
      assert contract.active == true
      assert contract.type == "some type"
      assert contract.value == 120.5
      assert contract.do == "some do"
      assert contract.po == "some po"
      assert contract.itq == "some itq"
      assert contract.startdate == ~D[2024-05-22]
      assert contract.enddate == ~D[2024-05-22]
      assert contract.svcalloperdevice == 42
      assert contract.timeallo == 42
    end

    test "create_contract/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contracts.create_contract(@invalid_attrs)
    end

    test "update_contract/2 with valid data updates the contract" do
      contract = contract_fixture()
      update_attrs = %{active: false, type: "some updated type", value: 456.7, do: "some updated do", po: "some updated po", itq: "some updated itq", startdate: ~D[2024-05-23], enddate: ~D[2024-05-23], svcalloperdevice: 43, timeallo: 43}

      assert {:ok, %Contract{} = contract} = Contracts.update_contract(contract, update_attrs)
      assert contract.active == false
      assert contract.type == "some updated type"
      assert contract.value == 456.7
      assert contract.do == "some updated do"
      assert contract.po == "some updated po"
      assert contract.itq == "some updated itq"
      assert contract.startdate == ~D[2024-05-23]
      assert contract.enddate == ~D[2024-05-23]
      assert contract.svcalloperdevice == 43
      assert contract.timeallo == 43
    end

    test "update_contract/2 with invalid data returns error changeset" do
      contract = contract_fixture()
      assert {:error, %Ecto.Changeset{}} = Contracts.update_contract(contract, @invalid_attrs)
      assert contract == Contracts.get_contract!(contract.id)
    end

    test "delete_contract/1 deletes the contract" do
      contract = contract_fixture()
      assert {:ok, %Contract{}} = Contracts.delete_contract(contract)
      assert_raise Ecto.NoResultsError, fn -> Contracts.get_contract!(contract.id) end
    end

    test "change_contract/1 returns a contract changeset" do
      contract = contract_fixture()
      assert %Ecto.Changeset{} = Contracts.change_contract(contract)
    end
  end
end
