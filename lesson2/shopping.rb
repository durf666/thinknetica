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
  summ = cost * number
  total += summ
  cart[name]= summ
end
p cart
p "Общая стоимость корзины покупок #{total}"
