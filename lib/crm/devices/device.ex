defmodule Crm.Devices.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "devices" do
    field :active, :boolean, default: false
    field :serialno, :string
    field :brand, :string
    field :model, :string
    field :currentlocation, :string
    field :remarks, :string
    belongs_to :contract, Crm.Contracts.Contract

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:serialno, :brand, :model, :currentlocation, :remarks, :contract_id, :active])
    |> validate_required([:serialno, :brand, :model, :currentlocation, :remarks, :contract_id, :active])
  end
end
