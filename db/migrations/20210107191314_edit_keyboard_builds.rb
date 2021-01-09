Hanami::Model.migration do
  change do
    alter_table :keyboards do
     drop_column :build_id
    end

    alter_table :builds do
     add_foreign_key :keyboard_id, :keyboards, on_delete: :cascade, null: true
    end 
  end
end
