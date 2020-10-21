result = {}
vowels = %w[a e i o u]

alphabet = ('a'..'z').to_a
alphabet.each  do |char|
  if vowels.include? char
    result[char] = alphabet.find_index(char) + 1
  end
end
