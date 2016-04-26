letters = ('a'..'z')
vocals = ['a', 'e', 'i', 'o', 'u', 'y']
vocals_out = {}
pos = 0
letters.each_with_index do |i, pos|
  vocals_out [i]= pos if vocals.include? i
end
p vocals_out