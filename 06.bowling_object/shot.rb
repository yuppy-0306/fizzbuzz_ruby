# frozen_string_literal: true

class Shot
  attr_reader :pins

  def initialize(pins)
    @pins = pins
  end

  def all_pins_down?
    @pins == Frame::MAX_PINS
  end
end
