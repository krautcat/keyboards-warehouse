module Web::Controllers::Keyboards
  class Index
    include Web::Action

    expose :keyboards
    expose :keysets
    expose :builds
    expose :switches
    
    def call(params)
      @keyboards = KeyboardRepository.new.all
      @keysets = KeysetRepository.new
      @builds = BuildRepository.new
      @switches = AssembledSwitchRepository.new
    end
  end
end
