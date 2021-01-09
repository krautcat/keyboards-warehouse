Hanami::Model.migration do
  change do
    rename_table :switches_and_springs, :assembled_switches
  end
end
