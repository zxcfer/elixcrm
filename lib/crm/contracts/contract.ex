defmodule Crm.Contracts.Contract do
  use Ecto.Schema
  import Ecto.Changeset

  alias Crm.Devices.Device

  schema "contracts" do
    field :active, :boolean, default: false
    field :type, :string
    field :value, :decimal
    field :do, :string
    field :po, :string
    field :itq, :string
    field :startdate, :date
    field :enddate, :date
    field :svcalloperdevice, :integer
    field :timeallo, :integer
    field :remarks, :string
    field :contractno, :string
    belongs_to :company, Crm.Companies.Company
    belongs_to :careof, Crm.Companies.Company
    has_many :devices, Device, on_delete: :delete_all

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contract, attrs) do
    contract
    |> cast(attrs, [:do, :po, :itq, :startdate, :enddate, :type, :svcalloperdevice, :timeallo, :value, :active, :contractno, :company_id, :careof_id, :remarks])
    |> validate_required([:po, :startdate, :enddate, :type, :active, :company_id, :contractno,])
  end
end
