alphabet_arr = ('a'..'z').to_a
alphabet_hash = {}
alphabet_arr.each.with_index(1) do |letter, num|
  alphabet_hash[num] =  letter
end

vowels_arr = ['a', 'e', 'i', 'o', 'u', 'y']
vowels_hash = {}

alphabet_hash.each do |num, letter|
  if vowels_arr.include? letter 
    vowels_hash[num] = letter
  end
end
