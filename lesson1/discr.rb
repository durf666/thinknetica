print "Введите коэффициент a:"
a = gets.chomp.to_f

print "Введите коэффициент b:"
b = gets.chomp.to_f

print "Введите коэффициент c:"
c = gets.chomp.to_f

d = b**2 - 4*a*c

if d < 0 
	puts "корней нет"
elsif d == 0
	x = -b/(2 * a)
	puts "уравнение имеет 1 корень х = #{x}"
else
	x1 = (-b + c)/ (2 * a)
	x2 = (-b - c)/ (2 * a)
	puts "уравнение имеет 2 корня"
	puts "x1 = #{x1}"
	puts "x2 = #{x2}"
end
