(1..20).each do |i|
    fizzbuzzz_num = 15
    fizz_num = 3
    buzz_num = 5
    if i % fizzbuzzz_num == 0 
        puts "FizzBuzz"
    elsif i % fizz_num == 0
        puts "Fizz"
    elsif i % buzz_num == 0
        puts "Buzz"
    else
        puts i
    end
end

#3,6,6,12,15,18-Fizz
#5,10,15-Buzz
#15-FizzBuzz
