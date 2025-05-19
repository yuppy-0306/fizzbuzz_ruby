(1..20).each do |i|
  fizzbuzz_num = 15
  fizz_num = 3
  buzz_num = 5
  if i % fizzbuzz_num == 0
    puts 'FizzBuzz'
  elsif i % fizz_num == 0
    puts 'Fizz'
  elsif i % buzz_num == 0
    puts 'Buzz'
  else
    puts i
  end
end
