puts "Введите стороны А"
side_a = gets.chomp.to_f

puts "Введите размер стороны Б"
side_b = gets.chomp.to_f

puts "Введите размер стороны C"
side_c = gets.chomp.to_f

max_of_a_and_b = [side_a, side_b].max
hypotenuse = [max_of_a_and_b,[side_a,side_c].max].max
cathetus_a = [side_a, side_b].min
cathetus_b = [max_of_a_and_b, side_c].min

if hypotenuse == cathetus_a && hypotenuse == cathetus_b
  puts "Треугольник равнобедренный и равносторонний"
elsif hypotenuse ** 2 == cathetus_a ** 2 + cathetus_b ** 2
  puts "Треугольник прямоугольный"
else
  puts "Треугольник не равнобедренный и не равносторонний"
end