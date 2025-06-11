# frozen_string_literal: true
class Frame
    attr_reader :shots

  def initialize(shots)
    @shots = shots
  end

  def total_pins
    @shots.sum(&:pins)
  end

  def strike?
    @shots.any?(&:strike?) && @shots.size == 1
  end

  def spare?
    !strike? && total_pins == 10
  end

  def open?
    total_pins < 10
  end
end