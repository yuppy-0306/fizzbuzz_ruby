# frozen_string_literal: true

require_relative 'frame'
require_relative 'shot'

class Game
  FIRST_NINE_FRAMES = 9
  MAX_PINS = 10
  def initialize(score_string)
    @shots = parse_raw_score_string(score_string)
    @frames = build_bowling_frames(@shots)
  end

  def calculate_score
    @frames.each_with_index.inject(0) do |total_score, (frame, idx)|
      if idx < FIRST_NINE_FRAMES
        bonus_for_strike = calculate_next_n_pins(idx, 2)
        bonus_for_spare = calculate_next_n_pins(idx, 1)
        total_score + frame.score(bonus_for_strike: bonus_for_strike, bonus_for_spare: bonus_for_spare)
      else
        total_score + frame.total_pins
      end
    end
  end

  private

  def parse_raw_score_string(score_string)
    score_string.split(',').map do |token|
      case token
      when 'X' then Shot.new(MAX_PINS)
      when '-' then Shot.new(0)
      when '/'
        Shot.new(MAX_PINS - shots.last.pins)
      else
        Shot.new(token.to_i)
      end
    end
  end

  def build_bowling_frames(shots)
    frames = []
    shot_index = 0

    FIRST_NINE_FRAMES.times do
      break if shot_index >= shots.size

      num_shots_in_frame = shots[shot_index].strike? ? 1 : 2

      num_shots_in_frame = 1 if !shots[shot_index].strike? && (shot_index + 1) >= shots.size

      current_frame_shots = shots[shot_index, num_shots_in_frame]
      frames << Frame.new(current_frame_shots)
      shot_index += num_shots_in_frame
    end

    frames << Frame.new(shots[shot_index..]) if shot_index < shots.size

    frames
  end

  def calculate_next_n_pins(current_frame_idx, count)
    @frames[(current_frame_idx + 1)..].flat_map(&:shots).first(count).sum(&:pins)
  end
end
