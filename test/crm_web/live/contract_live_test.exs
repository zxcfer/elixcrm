defmodule CrmWeb.ContractLiveTest do
  use CrmWeb.ConnCase

  import Phoenix.LiveViewTest
  import Crm.ContractsFixtures

  @create_attrs %{active: true, type: "some type", value: 120.5, do: "some do", po: "some po", itq: "some itq", startdate: "2024-05-22", enddate: "2024-05-22", svcalloperdevice: 42, timeallo: 42}
  @update_attrs %{active: false, type: "some updated type", value: 456.7, do: "some updated do", po: "some updated po", itq: "some updated itq", startdate: "2024-05-23", enddate: "2024-05-23", svcalloperdevice: 43, timeallo: 43}
  @invalid_attrs %{active: false, type: nil, value: nil, do: nil, po: nil, itq: nil, startdate: nil, enddate: nil, svcalloperdevice: nil, timeallo: nil}

  defp create_contract(_) do
    contract = contract_fixture()
    %{contract: contract}
  end

  describe "Index" do
    setup [:create_contract]

    test "lists all contracts", %{conn: conn, contract: contract} do
      {:ok, _index_live, html} = live(conn, ~p"/contracts")

      assert html =~ "Listing Contracts"
      assert html =~ contract.type
    end

    test "saves new contract", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/contracts")

      assert index_live |> element("a", "New Contract") |> render_click() =~
               "New Contract"

      assert_patch(index_live, ~p"/contracts/new")

      assert index_live
             |> form("#contract-form", contract: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#contract-form", contract: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/contracts")

      html = render(index_live)
      assert html =~ "Contract created successfully"
      assert html =~ "some type"
    end

    test "updates contract in listing", %{conn: conn, contract: contract} do
      {:ok, index_live, _html} = live(conn, ~p"/contracts")

      assert index_live |> element("#contracts-#{contract.id} a", "Edit") |> render_click() =~
               "Edit Contract"

      assert_patch(index_live, ~p"/contracts/#{contract}/edit")

      assert index_live
             |> form("#contract-form", contract: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#contract-form", contract: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/contracts")

      html = render(index_live)
      assert html =~ "Contract updated successfully"
      assert html =~ "some updated type"
    end

    test "deletes contract in listing", %{conn: conn, contract: contract} do
      {:ok, index_live, _html} = live(conn, ~p"/contracts")

      assert index_live |> element("#contracts-#{contract.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#contracts-#{contract.id}")
    end
  end

  describe "Show" do
    setup [:create_contract]

    test "displays contract", %{conn: conn, contract: contract} do
      {:ok, _show_live, html} = live(conn, ~p"/contracts/#{contract}")

      assert html =~ "Show Contract"
      assert html =~ contract.type
    end

    test "updates contract within modal", %{conn: conn, contract: contract} do
      {:ok, show_live, _html} = live(conn, ~p"/contracts/#{contract}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Contract"

      assert_patch(show_live, ~p"/contracts/#{contract}/show/edit")

      assert show_live
             |> form("#contract-form", contract: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#contract-form", contract: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/contracts/#{contract}")

      html = render(show_live)
      assert html =~ "Contract updated successfully"
      assert html =~ "some updated type"
    end
  end
end
