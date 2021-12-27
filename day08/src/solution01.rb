patterns = []
outputs = []

input = ARGF.each_line do |line|
    line = line.chomp.split("|")
    patterns << line[0].split
    outputs << line[1].split
end

unique_outputs = outputs.sum do |output|
    uniques = output.select do |seq|
        [2,3,4,7].include?(seq.length) # check if length of output matches any of the unique lengths
    end
    
    uniques.count
end

p unique_outputs