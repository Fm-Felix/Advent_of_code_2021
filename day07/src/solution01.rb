input = ARGF.read
positions = input.split(",").map(&:to_i).tally


least_fuel = positions.keys.map {|pos_align| 
    fuel = positions.sum { |pos,num| 
        (pos - pos_align).abs * num }

    [pos_align, fuel]
}.min_by { |pos_align, fuel| fuel }
p least_fuel