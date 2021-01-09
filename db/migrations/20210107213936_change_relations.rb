Hanami::Model.migration do
  change do
    alter_table :keyboards do
      drop_column :keyset_id
    end
    
    alter_table :builds do
      drop_column :keyboard_id

  
      add_foreign_key :keyboard_id, :keyboards, null: true
    end

    alter_table :switches_and_springs do
      add_foreign_key :build_id, :builds, null: true
    end
  end
end
