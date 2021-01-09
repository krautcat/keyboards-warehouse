class AssembledSwitchRepository < Hanami::Repository
  def for_build(build)
    switches = SwitchRepository.new.switches
    springs = SpringRepository.new.springs

    manus = ManufacturerRepository.new.manufacturers
    spring_types = SpringTypeRepository.new.spring_types

    assembled_switches_in_build = assembled_switches
    .where(build_id: build.id)

    build_switches = []

    assembled_switches_in_build.each do |build_switch|
    switch = switches
      .where(id: build_switch.switch_id)
      .one

    switch_manu = manus
      .where(id: switch.manufacturer)
      .one
      
    spring = springs
      .where(id: build_switch.spring_id)
      .one

    spring_manu = manus
      .where(id: spring.manufacturer)
      .one
    spring_type = spring_types
      .where(id: spring.type)
      .one

    spring_str = ""
    spring_str << (spring_manu.name == switch_manu.name ? "" : "#{spring_manu.name} ")
    if spring.weight.frac > BigDecimal.new("0.0")
      spring_weight = spring.weight.truncate(1).to_s("F")
    else
      spring_weight = spring.weight.to_i.to_s
    end
    spring_str << "#{spring_weight}g "
    
    if spring_type.type.to_s != "linear" 
      spring_str << spring_type.type
    end

    assembled_switch = KeyboardWarehouse::Keyboard::Internal::AssembledSwitch.new(
      name: switch.name,
      film: switch.switch_films,
      lube: switch.lube,
      spring: spring_str
    )
    
    build_switches << assembled_switch    
    end

    return build_switches
  end
end
