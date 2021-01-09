Hanami::Model.migration do
  change do
    alter_table :keysets do
      add_foreign_key :keyboard_id, :keyboards, null: false, default: 1
    end

    alter_table :switches_and_springs do
      set_column_not_null :switch_id
      set_column_not_null :spring_id
    end
  end
end
