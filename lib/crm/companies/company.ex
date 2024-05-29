defmodule Crm.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset
  # alias Crm.Contacts.Contact
  # alias Crm.Contracts.Contract

  schema "companies" do
    field :name, :string
    field :billingadd1, :string
    field :billingadd2, :string
    field :postalcode, :string
    belongs_to :country, Crm.Countries.Country
    # has_many :contacts, Contact, on_delete: :delete_all
    # has_many :contracts, Contract, on_delete: :delete_all

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :billingadd1, :billingadd2, :postalcode, :country_id])
    |> validate_required([:name, :billingadd1, :billingadd2, :postalcode, :country_id])
  end
end
