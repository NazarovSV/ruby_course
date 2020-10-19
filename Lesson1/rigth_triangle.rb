puts "Введите стороны А"
side_a = gets.chomp.to_f

puts "Введите размер стороны Б"
side_b = gets.chomp.to_f

puts "Введите размер стороны C"
side_c = gets.chomp.to_f


if side_a == side_b && side_a == side_b
  puts "Треугольник равнобедренный и равносторонний"
elsif (side_a > side_b && side_a > side_c && side_a ** 2 == side_b ** 2 + side_c ** 2) ||
  (side_b > side_a && side_b > side_c && side_b ** 2 == side_a ** 2 + side_c ** 2)||
  (side_c > side_a && side_c > side_b && side_c ** 2 == side_a ** 2 + side_b ** 2)
  puts "Треугольник равнобедренный и равносторонний"
else
  puts "Треугольник не равнобедренный и не равносторонний"
end