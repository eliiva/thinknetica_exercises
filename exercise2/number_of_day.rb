puts "Enter a day:"
day = gets.chomp.to_i

puts "Enter a month:"
month = gets.chomp.to_i

puts "Enter a year:"
year = gets.chomp.to_i

simple_year_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
leap_year_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if (year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0))
   days_arr = leap_year_days
else
  days_arr = simple_year_days
end

number = days_arr[0, month].reduce(:+)
puts number
