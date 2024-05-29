defmodule Crm.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def change do
    create table(:countries) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
