Hanami::Model.migration do
  change do
    alter_table :switches do
      add_foreign_key :manufacturer, :manufacturers, on_delete: :set_null, null: true 
    end
  end
end
