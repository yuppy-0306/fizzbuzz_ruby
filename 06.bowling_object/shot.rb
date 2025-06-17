# frozen_string_literal: true

class Shot
  MAX_PINS = 10
  attr_reader :pins

  def initialize(pins)
    @pins = pins
  end

  def strike?
    @pins == MAX_PINS
  end
end
