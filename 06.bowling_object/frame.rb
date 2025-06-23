# frozen_string_literal: true

class Frame
  MAX_PINS = 10
  attr_reader :shots, :next_shots

  def initialize(shots, next_shots = [])
    @shots = shots
    @next_shots = next_shots
  end

  def total_pins
    @shots.sum(&:pins)
  end

  def strike?
    @shots.first&.pins == MAX_PINS && @shots.size == 1
  end

  def spare?
    !strike? && total_pins == MAX_PINS
  end

  def score
    base = total_pins

    if strike?
      base + next_shots.first(2).sum(&:pins)
    elsif spare?
      base + next_shots.first&.pins.to_i
    else
      base
    end
  end

end
