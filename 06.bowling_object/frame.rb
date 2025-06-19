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
    @shots.any?(&:strike?) && @shots.size == 1
  end

  def spare?
    !strike? && total_pins == MAX_PINS
  end

  def score(frames, idx)
    base = total_pins
    return base if idx >= 9
    subsequent_shots = frames[(idx + 1)..].flat_map(&:shots)

    if strike?
      base + subsequent_shots.first(2).sum(&:pins)
    elsif spare?
      base + subsequent_shots.first(1).sum(&:pins)
    else
      base
    end
  end
end
