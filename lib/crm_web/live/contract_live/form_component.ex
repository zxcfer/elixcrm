defmodule CrmWeb.ContractLive.FormComponent do
  use CrmWeb, :live_component

  alias Crm.Contracts

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage contract records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="contract-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:company_id]}
          type="select" label="Company"
          options={Enum.map(@companies, &{&1.name, &1.id})}
        />
        <.input
          field={@form[:careof_id]}
          type="select" label="c/o"
          options={Enum.map(@companies, &{&1.name, &1.id})}
        />
        <.input field={@form[:contractno]} type="text" label="Contract Number" />
        <.input field={@form[:do]} type="text" label="Delivery Order" />
        <.input field={@form[:po]} type="text" label="Purchase Order Number" />
        <.input field={@form[:itq]} type="text" label="ITQ Number" />
        <.input field={@form[:startdate]} type="date" label="Startdate" />
        <.input field={@form[:enddate]} type="date" label="Enddate" />
        <.input field={@form[:type]} type="select" label="Contract Type"
          options=
              {
                [ {"Preventive Maintenance", "PM"},
                  {"Emergency Maintenance", "EM"},
                  {"Ad-hoc", "AHoc"}
                ]
              }
        />
        <.input field={@form[:svcalloperdevice]} type="number" label="Service allocation per device" />
        <.input field={@form[:timeallo]} type="number" label="Time allocated for entire contract" />
        <.input field={@form[:value]} type="number" label="Value" step="any" />
        <.input field={@form[:active]} type="checkbox" label="Active" checked />
        <.input field={@form[:remarks]} type="textarea" label="Remarks" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Contract</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{contract: contract} = assigns, socket) do
    changeset = Contracts.change_contract(contract)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"contract" => contract_params}, socket) do
    changeset =
      socket.assigns.contract
      |> Contracts.change_contract(contract_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"contract" => contract_params}, socket) do
    save_contract(socket, socket.assigns.action, contract_params)
  end

  defp save_contract(socket, :edit, contract_params) do
    case Contracts.update_contract(socket.assigns.contract, contract_params) do
      {:ok, contract} ->
        notify_parent({:saved, contract})

        {:noreply,
         socket
         |> put_flash(:info, "Contract updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_contract(socket, :new, contract_params) do
    case Contracts.create_contract(contract_params) do
      {:ok, contract} ->
        notify_parent({:saved, contract})

        {:noreply,
         socket
         |> put_flash(:info, "Contract created successfully")
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
