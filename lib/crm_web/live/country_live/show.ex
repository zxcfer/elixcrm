defmodule CrmWeb.CountryLive.Show do
  use CrmWeb, :live_view

  alias Crm.Countries

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:country, Countries.get_country!(id))}
  end

  defp page_title(:show), do: "Show Country"
  defp page_title(:edit), do: "Edit Country"
end
