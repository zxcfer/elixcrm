defmodule Crm.Repo.Migrations.CreateContracts do
  use Ecto.Migration

  def change do
    create table(:contracts) do
      add :do, :string
      add :po, :string
      add :itq, :string
      add :startdate, :date
      add :enddate, :date
      add :type, :string
      add :svcalloperdevice, :integer
      add :timeallo, :integer
      add :value, :decimal
      add :active, :boolean, default: false, null: false
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:contracts, [:company_id])
  end
end
