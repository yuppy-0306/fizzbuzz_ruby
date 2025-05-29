#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = scores.map { |s| s == 'X' ? 10 : s.to_i }

frames = []
i = 0
while frames.size < 9
  if shots[i] == 10
    frames << [10]
    i += 1
  else
    frames << [shots[i], shots[i + 1]]
    i += 2
  end
end
frames << shots[i..]

point = 0

frames.each do |frame|
  point += frame.sum
end

frames.each_with_index do |frame, idx|
  next if idx >= 9 || (frame.sum < 10 && frame[0] != 10)

  if frame[0] == 10
    next_frame = frames[idx + 1]
    bonus = if next_frame[0] == 10 && idx < 8
              10 + frames[idx + 2][0]
            else
              next_frame[0] + (next_frame[1] || 0)
            end
    point += bonus
    next
  end

  point += frames[idx + 1][0]
end

puts point
