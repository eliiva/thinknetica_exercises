fibonachi_arr = [0, 1]

while (new_number = fibonachi_arr[-1] + fibonachi_arr[-2])  <= 100
  fibonachi_arr.push(new_number)
end

puts fibonachi_arr
