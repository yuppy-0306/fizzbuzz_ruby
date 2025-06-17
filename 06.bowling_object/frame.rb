# frozen_string_literal: true

class Frame
  MAX_PINS = 10
  attr_reader :shots

  def initialize(shots)
    @shots = shots
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

  def score(bonus_for_strike: 0, bonus_for_spare: 0)
    base = total_pins

    if strike?
      base + bonus_for_strike
    elsif spare?
      base + bonus_for_spare
    else
      base
    end
  end
end
