class BuildRepository < Hanami::Repository
  def for_keyboard(keyboard)
    builds
      .where(keyboard_id: keyboard.id)
  end
end
