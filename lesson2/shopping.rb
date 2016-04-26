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

  total += cost * number
  cart [name]={cost: cost, number: number}
end

p cart
cart.each {|name| p "Товар: #{name[0]} стоимость: #{name[1][:cost] * name[1][:number]}"}
p "Итоговая сумма покупок: " + total.to_s
