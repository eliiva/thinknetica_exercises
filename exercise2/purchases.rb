stop = false
purchases = {}

until stop
  puts "Укажите название товара:"
  name = gets.chomp

  if name == "стоп"
    stop = true
  else
    puts "Укажите цену товара:"
    cost = gets.chomp.to_i

    puts "Укажите количество товара:"
    quantity = gets.chomp.to_f

    purchases[name] = {cost: cost, quantity: quantity}
  end
end

if purchases.any? 
  sum_array = []
  puts purchases
  puts "Итого за каждый товар:"
  
  purchases.each do |name, info|
    sum = info[:cost] * info[:quantity]
    sum_array.push(sum)
    puts " #{name}: #{sum}"
  end

  puts "Общая стоимость покупок:"
  puts sum_array[0, sum_array.size].reduce(:+)
end
