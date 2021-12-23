input = ARGF.read
numbers = input.split("\n")

o2 = numbers.map(&:chars)

puts o2.to_s