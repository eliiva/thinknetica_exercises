alphabet_arr = ('a'..'z').to_a
alphabet_hash = Hash[(1...alphabet_arr.size).zip alphabet_arr]
vowels_arr = ['a', 'e', 'i', 'o', 'u', 'y']

vowels_hash = Hash.new

alphabet_hash.each do |num, letter|
  if vowels_arr.include? letter 
    vowels_hash[num] = letter
  end
end
