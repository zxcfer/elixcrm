defmodule Crm.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string
      add :email, :string
      add :mobileno, :string
      add :officeno, :string
      add :location, :text
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:contacts, [:company_id])
  end
end
