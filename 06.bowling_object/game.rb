# frozen_string_literal: true

require_relative 'frame'
require_relative 'shot'

class Game
  def initialize(score_string)
    @shots = parse_shots(score_string)
    @frames = build_frames(@shots)
  end

  def calculate_score
    @frames.each_with_index.sum { |frame, idx| frame.score(@frames, idx) }
  end

  private

  def parse_shots(score_string)
    score_string.split(',').map { |s| Shot.new(s == 'X' ? 10 : s.to_i) }
  end

  def build_frames(shots)
    frames = []
    i = 0
    9.times do
      if shots[i].strike?
        frames << Frame.new([shots[i]])
        i += 1
      else
        frames << Frame.new([shots[i], shots[i + 1]])
        i += 2
      end
    end
    frames << Frame.new(shots[i..])
    frames
  end
end
