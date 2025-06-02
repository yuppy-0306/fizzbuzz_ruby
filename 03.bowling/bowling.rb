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

frames.each_with_index do |frame, idx|
  

  point += frame.sum

  next if idx >= 9 || frame.sum < 10

  point += frames[idx + 1][0]
  next if frame[0] != 10

  point += if frames[idx + 1][0] == 10 && idx < 8
             frames[idx + 2][0]
           else
             frames[idx + 1][1] || 0
           end
end



puts point
