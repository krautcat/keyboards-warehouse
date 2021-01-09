Hanami::Model.migration do
  change do
    alter_table :switches do
      drop_column :springs
    end

    create_table :springs do
      primary_key :id

      foreign_key :manufacturer, :spring_manufacturers, null: true
      foreign_key :type, :spring_types, null: false

      column :weight, BigDecimal, null: false
    end

    create_table :spring_manufacturers do
      primary_key :id

      column :name, String, null: false, unique: true
    end

    create_table :spring_types do
      primary_key :id

      column :type, String, null: false, unique: true
    end

    create_table :switches_and_springs do
      primary_key :id

      foreign_key :switch_id, :switches, null: false
      foreign_key :spring_id, :springs, null: false
    end
  end
end
