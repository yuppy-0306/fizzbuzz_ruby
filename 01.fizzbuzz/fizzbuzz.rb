(1..20).each do |i|
    if i % 3 == 0 && i % 5 == 0
        puts "FizzBuzz"
    elsif i % 3 == 0
        puts "Fizz"
    elsif i % 5 == 0
        puts "Buzz"
    else
        puts i
    end
end

#3,6,6,12,15,18-Fizz
#5,10,15- Buzz
#15-FizzBuzz