Hanami::Model.migration do
  change do
    create_table :keyboards do
      primary_key :id
      foreign_key :build_id, :builds, on_delete: :cascade, null: false 
      foreign_key :keyset_id, :keysets, on_delte: :cascade, null: false

      column :name, String, null: false
      column :color, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    create_table :builds do
      primary_key :id
      foreign_key :switch_id, :switches, on_delete: :cascade, null: false
      
      column :plate, String, null: false
      column :stabilizer, String, null: false
    end

    create_table :keysets do
      primary_key :id

      column :name, String, null: false
      column :profile, String, null: false
      column :manufacturer, String, null: false
      column :tooling, String, null: false
    end

    create_table :switches do
      primary_key :id

      column :name, String, null: false
      column :type, String, null: false
      column :springs, String, null: false
      column :switch_films, String, null: true
      column :lube, String, null: true
    end
  end
end
