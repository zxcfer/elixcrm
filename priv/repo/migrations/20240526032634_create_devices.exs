defmodule Crm.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :serialno, :string
      add :brand, :string
      add :model, :string
      add :currentlocation, :text
      add :remarks, :text
      add :active, :boolean, default: false, null: false
      add :contract_id, references(:contracts, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:devices, [:contract_id])
  end
end
