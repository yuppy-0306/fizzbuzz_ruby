# frozen_string_literal: true

require_relative 'frame'
require_relative 'shot'

class Game
  def initialize(score_string)
    @shots = parse_shots(score_string)
    @frames = build_frames(@shots)
  end

  def calculate_score
    @frames.sum(&:score)
  end

  private

  def parse_shots(score_string)
    score_string.split(',').map { |s| Shot.new(s == 'X' ? Frame::MAX_PINS : s.to_i) }
  end

  def build_frames(shots)
    frames = []
    i = 0
    9.times do
      if shots[i].all_pins_down?
        frames << Frame.new([shots[i]], shots[(i + 1)..(i + 2)])
        i += 1
      else
        frames << Frame.new([shots[i], shots[i + 1]], [shots[i + 2]])
        i += 2
      end
    end
    frames << Frame.new(shots[i..], [])
    frames
  end
end
