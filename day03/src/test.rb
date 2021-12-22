input = ARGF.read
numbers = input.split

o2 = numbers.map(&:chars)

puts o2.to_s