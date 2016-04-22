print "Введите ваше имя :"
name = gets.chomp

print "Ведите ваш вес:"
weight = gets.chomp.to_i

print "Ведите ваш рост:"
height = gets.chomp.to_i

perfect_weight = height - 110

if weight < perfect_weight
	puts "#{name}, ваш вес уже оптимальный"
else
	puts "#{name} ваш оптимальный вес #{perfect_weight}"
end