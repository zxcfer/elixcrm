defmodule Crm.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :billingadd1, :text
      add :billingadd2, :text
      add :postalcode, :string
      add :country_id, references(:countries, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:companies, [:country_id])
  end
end
