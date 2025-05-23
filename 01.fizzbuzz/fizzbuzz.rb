def fizz_buzz(i)
  if i % 15 == 0
    'FizzBuzz'
  elsif i % 3 == 0
    'Fizz'
  elsif i % 5 == 0
    'Buzz'
  else
    i.to_s
  end
end

# FizzBuzzの出力

(1..20).each do |i|
  puts fizz_buzz(i)
end
