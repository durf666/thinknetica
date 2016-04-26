letters = ('a'..'z').to_a
vocals = ['a', 'e', 'i', 'o', 'u', 'y']
vocals_2 = []
pos = 0
letters.each do |i|
  pos+= 1
  vocals_2 << [i, pos] if vocals.include? i
end
vocals_hash=vocals_2.to_h
p vocals_hash