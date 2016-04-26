cart = {}
total = 0
loop do
  print "Введите имя товара: "
  name = gets.chomp
  break if name == 'стоп'
  print "Введите цену товара: "
  cost = gets.chomp.to_i
  print "Введите количество товара: "
  number = gets.chomp.to_i
  names << name
  costs << cost
  numbers << number
end

names.each_with index do |name, index|
  summ = cost[index] * number[index]
  total += summ
  cart[name]= summ
p cart
p "Общая стоимость корзины покупок #{total}"
