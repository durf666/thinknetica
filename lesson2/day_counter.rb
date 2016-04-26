print "Введите число:"
day = gets.chomp.to_i

print "Введите месяц:"
month = gets.chomp.to_i - 1

print "Введите год:"
year = gets.chomp.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
months[1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 ==0
day_position = day
counter = 0
if month > 0
  while counter < month do
    day_position += months[counter]
    p day_position
    counter += 1
  end
end
puts "Введенный вами день #{day_position} в году"