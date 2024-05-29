defmodule CrmWeb.CountryLive.FormComponent do
  use CrmWeb, :live_component

  alias Crm.Countries

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage country records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="country-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Country</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{country: country} = assigns, socket) do
    changeset = Countries.change_country(country)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"country" => country_params}, socket) do
    changeset =
      socket.assigns.country
      |> Countries.change_country(country_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"country" => country_params}, socket) do
    save_country(socket, socket.assigns.action, country_params)
  end

  defp save_country(socket, :edit, country_params) do
    case Countries.update_country(socket.assigns.country, country_params) do
      {:ok, country} ->
        notify_parent({:saved, country})

        {:noreply,
         socket
         |> put_flash(:info, "Country updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_country(socket, :new, country_params) do
    case Countries.create_country(country_params) do
      {:ok, country} ->
        notify_parent({:saved, country})

        {:noreply,
         socket
         |> put_flash(:info, "Country created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
