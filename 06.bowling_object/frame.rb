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

  def score(frames, idx)
    base = total_pins
    return base if idx >= 9
    if strike?
      base + next_pins(frames, idx, 2)
    elsif spare?
      base + next_pins(frames, idx, 1)
    else
      base
    end
  end

  def next_pins(frames, idx, n)
    shots = frames[(idx + 1)..].flat_map(&:shots)
    shots.first(n).sum(&:pins)
  end
end