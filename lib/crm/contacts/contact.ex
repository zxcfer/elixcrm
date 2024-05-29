defmodule Crm.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :name, :string
    field :location, :string
    field :email, :string
    field :mobileno, :string
    field :officeno, :string
    belongs_to :company, Crm.Companies.Company

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :email, :mobileno, :officeno, :location, :company_id])
    |> validate_required([:name, :email, :mobileno, :officeno, :location, :company_id])
  end
end
