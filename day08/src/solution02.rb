input = ARGF.read
positions = input.split(",").map(&:to_i).tally
alignments = (0..positions.max[0]) # range over possible alignments

least_fuel = alignments.map {|pos_align| 
    fuel = positions.sum { |pos,num| 
        distance = (pos - pos_align).abs
        (1..distance).sum * num 
    }
    [pos_align, fuel]
}.min_by { |pos_align,  fuel| fuel}
p least_fuel