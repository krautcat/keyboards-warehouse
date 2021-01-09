class KeysetRepository < Hanami::Repository
  def from_keyboard(keyboard)
    keysets
      .where(keyboard_id: keyboard.id)
      .one  
  end
end
