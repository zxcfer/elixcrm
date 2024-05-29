defmodule Crm.Countries.Country do
  use Ecto.Schema
  import Ecto.Changeset
  # alias Crm.Companies.Company

  schema "countries" do
    field :name, :string
    # has_many :companies, Company, on_delete: :delete_all

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
