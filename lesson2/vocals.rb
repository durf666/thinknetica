letters = ('a'..'z').to_a
vocals = ['a', 'e', 'i', 'o', 'u', 'y']
vocals_hash={}
pos = 0
letters.each do |i|
	pos+= 1
	puts( i + ' ' + pos.to_s)
end