#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = scores.map { |s| s == 'X' ? 10 : s.to_i }

frames = []
i = 0
while frames.size < 10
  if shots[i] == 10 && frames.size < 9
    frames << [10]
    i += 1
  else
    frames << [shots[i], shots[i + 1]]
    i += 2
  end
end

point = 0
frames.each_with_index do |frame, idx|
  if idx < 9

    if frame[0] == 10
      next_frame = frames[idx + 1]
      bonus = if next_frame[0] == 10 && idx < 8
                10 + frames[idx + 2][0]
              else
                next_frame[0] + next_frame[1]
              end
      point += 10 + bonus

    elsif frame.sum == 10
      point += 10 + frames[idx + 1][0]
    else
      point += frame.sum
    end
  else

    point += shots[i - 2, 3].compact.sum
  end
end

puts point
