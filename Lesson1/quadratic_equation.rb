puts "Введите коэффициент a"
coefficient_a = gets.chomp.to_i

puts "Введите коэффициент b"
coefficient_b = gets.chomp.to_i

puts "Введите коэффициент c"
coefficient_c = gets.chomp.to_i

discriminant = coefficient_b ** 2 - 4 * coefficient_a * coefficient_c

if discriminant < 0
  puts "Дискриминант равен #{discriminant}. Корней нет"
elsif discriminant == 0
  root = (-coefficient_b + Math.sqrt(discriminant))/ (2 * coefficient_a)
  puts "Дискриминант равен #{discriminant}. Корень равен #{root}"
else
  discriminant_sqrt = Math.sqrt(discriminant)
  denominator = 2 * coefficient_a
  root_x1 = (-coefficient_b + discriminant_sqrt)/ denominator
  root_x2 = (-coefficient_b - discriminant_sqrt)/ denominator
  puts "Дискриминант равен #{discriminant}. Первый корень равен #{root_x1}, второй корень равен #{root_x2}"
end