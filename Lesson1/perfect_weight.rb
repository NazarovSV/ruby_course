puts "Назовите ваше имя?"
name = gets.chomp
puts "Назовите ваш рост?"
height = gets.chomp.to_i

perfect_weight = (height - 110) * 1.15
if perfect_weight >= 0
  puts "#{name}, выш идеальный вес равен #{perfect_weight}"
else
  puts "Ваш вес уже оптимальный"
end


