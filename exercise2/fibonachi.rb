fibonachi_arr = [0, 1]

while (fibonachi_arr[-1] + fibonachi_arr[-2])  <= 100
  fibonachi_arr.push(fibonachi_arr[-1] + fibonachi_arr[-2])
end

puts fibonachi_arr
