Hanami::Model.migration do
  change do
    alter_table :builds do
      drop_column :switch_id
    end
  end
end
