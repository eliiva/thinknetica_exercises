puts "what's your name?"
name = gets.chomp.capitalize

puts "Enter your height, please."
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight >= 0
  puts "Hello, #{name}! Your ideal_weight is #{ideal_weight}!"
else
  puts "Hello, #{name}! Your weight is almost ideal!"
end