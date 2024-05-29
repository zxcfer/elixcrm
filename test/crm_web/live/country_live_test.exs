defmodule CrmWeb.CountryLiveTest do
  use CrmWeb.ConnCase

  import Phoenix.LiveViewTest
  import Crm.CountriesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_country(_) do
    country = country_fixture()
    %{country: country}
  end

  describe "Index" do
    setup [:create_country]

    test "lists all countries", %{conn: conn, country: country} do
      {:ok, _index_live, html} = live(conn, ~p"/countries")

      assert html =~ "Listing Countries"
      assert html =~ country.name
    end

    test "saves new country", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/countries")

      assert index_live |> element("a", "New Country") |> render_click() =~
               "New Country"

      assert_patch(index_live, ~p"/countries/new")

      assert index_live
             |> form("#country-form", country: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#country-form", country: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/countries")

      html = render(index_live)
      assert html =~ "Country created successfully"
      assert html =~ "some name"
    end

    test "updates country in listing", %{conn: conn, country: country} do
      {:ok, index_live, _html} = live(conn, ~p"/countries")

      assert index_live |> element("#countries-#{country.id} a", "Edit") |> render_click() =~
               "Edit Country"

      assert_patch(index_live, ~p"/countries/#{country}/edit")

      assert index_live
             |> form("#country-form", country: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#country-form", country: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/countries")

      html = render(index_live)
      assert html =~ "Country updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes country in listing", %{conn: conn, country: country} do
      {:ok, index_live, _html} = live(conn, ~p"/countries")

      assert index_live |> element("#countries-#{country.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#countries-#{country.id}")
    end
  end

  describe "Show" do
    setup [:create_country]

    test "displays country", %{conn: conn, country: country} do
      {:ok, _show_live, html} = live(conn, ~p"/countries/#{country}")

      assert html =~ "Show Country"
      assert html =~ country.name
    end

    test "updates country within modal", %{conn: conn, country: country} do
      {:ok, show_live, _html} = live(conn, ~p"/countries/#{country}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Country"

      assert_patch(show_live, ~p"/countries/#{country}/show/edit")

      assert show_live
             |> form("#country-form", country: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#country-form", country: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/countries/#{country}")

      html = render(show_live)
      assert html =~ "Country updated successfully"
      assert html =~ "some updated name"
    end
  end
end
