Hanami::Model.migration do
  change do
    create_table? :keysets do
      primary_key :id

      column :name, String, null: false
      column :profile, String, null: false
      column :manufacturer, String, null: false
      column :tooling, String, null: false
    end

    create_table? :switches do
      primary_key :id

      column :name, String, null: false
      column :type, String, null: false
      column :springs, String, null: false
      column :switch_films, String, null: true
      column :lube, String, null: true
    end
  end
end
