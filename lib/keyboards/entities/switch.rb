class Switch < Hanami::Entity
end

module KeyboardWarehouse
  module Keyboard
    module Internal
      class AssembledSwitch < Hanami::Entity
        attributes do 
          attribute :name,    Types::String
          attribute :spring,  Types::String
          attribute :film,    Types::String
          attribute :lube,    Types::String
        end
      end
    end
  end
end
