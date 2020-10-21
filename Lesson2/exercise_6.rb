cart = Hash.new

loop do
  puts "Введите название товара: "
  title = gets.chomp
  break if title == "стоп"

  puts "Введите цену товара: "
  price = gets.chomp.to_i

  puts "Введите кол-во купленного товара: "
  quantity = gets.chomp.to_f

  cart[title.to_sym] = {price => quantity}
end

total_price = 0
cart.each do |title, price_and_quantity|
  total_price_of_product = 0
  price_and_quantity.each {|price, quantity| total_price_of_product = price * quantity}
  total_price += total_price_of_product

  puts "Товара #{title} куплено на #{total_price_of_product}"
end

puts "Общая сумма: #{total_price}"