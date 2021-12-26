input = ARGF.read
positions = input.split(",").map(&:to_i).tally