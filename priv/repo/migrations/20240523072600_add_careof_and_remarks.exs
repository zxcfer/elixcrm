defmodule Crm.Repo.Migrations.AddCareofAndRemarks do
  use Ecto.Migration

  def change do
    alter table(:contracts) do
      add :contractno, :string
      add :remarks, :text
      add :careof_id, references(:companies, on_delete: :nothing)

    end

  end
end
