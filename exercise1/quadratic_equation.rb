puts "Enter the a value:"
a = gets.chomp.to_i

puts "Enter the b value:"
b = gets.chomp.to_i

puts "Enter the c value:"
c = gets.chomp.to_i

discriminant = b**2 - 4 * a * c

puts "discriminant = #{discriminant}"

if discriminant < 0
  puts "The discriminant is #{discriminant}. There are no roots in the equation. =("
elsif discriminant == 0
  x = - b / (2 * a)
  puts "The discriminant is 0. x = #{x}."
else
  x1 = (- b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (- b - Math.sqrt(discriminant)) / (2 * a)
  puts "The discriminant is #{discriminant}. x1 = #{x1}, x2 = #{x2}."
end