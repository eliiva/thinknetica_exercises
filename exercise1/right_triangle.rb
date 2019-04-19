puts "Enter the first side:"
first = gets.chomp.to_i

puts "Enter the second side:"
second = gets.chomp.to_i

puts "Enter the third side:"
third = gets.chomp.to_i

right = false
isosceles = false
equilateral = false

if first == second || first == third || second == third
  isosceles = true
end

if isosceles && first == second && first == third
  equilateral = true
end

if equilateral
  puts "Sorry, the triangle is isosceles and equilateral, but not right."
else
  if first > second && first > third
    hypotenuse = first
    cathetus_1 = second
    cathetus_2 = third
  elsif second > third
  	hypotenuse = second
  	cathetus_1 = first
  	cathetus_2 = third
  else
  	hypotenuse = third
  	cathetus_1 = first
  	cathetus_2 = second
  end 

  if hypotenuse ** 2 == cathetus_1 ** 2 + cathetus_2 ** 2
    right = true
  end

  if right && isosceles
    puts "The triangle is right and isosceles."
  elsif right
    puts "The triangle is right."
  elsif isosceles
    puts "The triangle is isosceles, but not right."
  else
    puts "The triangle is not right."  	
  end
end