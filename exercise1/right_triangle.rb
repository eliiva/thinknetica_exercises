puts "Enter the first side:"
first = gets.chomp.to_i

puts "Enter the second side:"
second = gets.chomp.to_i

puts "Enter the third side:"
third = gets.chomp.to_i

if first == second && first == third
  puts "Sorry, the triangle is isosceles and equilateral, but not right."
else
  side_a, side_b, hypotenuse = [first, second, third].sort

  if hypotenuse ** 2 == side_a ** 2 + side_b ** 2
    puts "The triangle is right."
  else
    puts "The triangle is not right."
  end

  if side_a == side_b
    puts "The triangle is isosceles."
  end
end
