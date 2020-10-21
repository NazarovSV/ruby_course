vowels = Hash.new

alphabet = ('a'..'z').to_a
alphabet.each  do |char|
  if char == 'a' || char == 'e' || char == 'i' || char == "o" || char == "u"
    vowels[char] = alphabet.find_index(char) + 1
  end
end
