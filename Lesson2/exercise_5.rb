months = {
  1 => 31,
  2 => {
    'not_leap' => 28,
    'leap' => 29
  },
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

puts "Назовите год"
year = gets.chomp.to_i

puts "Назовите месяц"
month = gets.chomp.to_i

puts "Назовите день"
day = gets.chomp.to_i

leap = month > 1 && (year % 400 ==0 || (year % 4 == 0 && year % 100 != 0))? 'leap' : 'not_leap'

day_of_current_year = day
(1..month - 1).each do |month_number|
  if month_number != 2
    day_of_current_year += months[month_number]
  else
    day_of_current_year += months[month_number][leap].to_i
  end
end

puts "Порядковый номер даты - #{day_of_current_year}"
