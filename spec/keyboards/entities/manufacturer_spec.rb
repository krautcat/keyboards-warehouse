RSpec.describe Manufacturer, type: :entity do
  it 'can be initialized with attributes' do
    manu = Manufacturer.new(name: "Gateron")
    expect(manu.name).to eq("Gateron")
  end
end
