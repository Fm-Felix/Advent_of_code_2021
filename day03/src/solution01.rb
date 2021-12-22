data = Array.new(12) {[]} #Array of 12 bit-sequences

ARGF.each_line { |line|
    line.chomp.chars.each.with_index {|c, i| data[i] << c.to_i}
}

gamma = data.map { |bl| bl.tally.max_by{ |k, v| v }.first } # calculate most frequent bit
epsilon = gamma.map { |b| b == 0 ? 1 : 0 }.join.to_i(2) # flip the bits and convert to integer
gamma = gamma.join.to_i(2) # convert to integer

puts epsilon * gamma







