print "Введите длину стороны a треугольника:"
a = gets.chomp.to_i

print "Введите длину стороны b треугольника:"
b = gets.chomp.to_i

print "Введите длину стороны c треугольника:"
c = gets.chomp.to_i

arr = [a, b, c].sort!
if arr[2]**2 == arr[1]**2 + arr[0]**2
	if arr [1] == [0]
		puts "треугольник прямоугольный и равнобедренный"
	else
		puts "треугольник прямоугольный"
	end
elsif arr[2] == arr[1] && arr[1] == arr[0] 
	puts "треугольник равносторонний"
elsif arr[1] == arr[0]
	puts "треугольник не прямоугольный, но равнобедренный"
else
	puts "треугольник не прямоугольный"
end