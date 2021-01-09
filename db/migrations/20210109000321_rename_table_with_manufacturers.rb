Hanami::Model.migration do
  change do
    rename_table :spring_manufacturers, :manufacturers
  end
end
