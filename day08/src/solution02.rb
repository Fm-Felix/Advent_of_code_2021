patterns = []
outputs = []

input = ARGF.each_line do |line|
    line = line.chomp.split("|")
    patterns << line[0].split
    outputs << line[1].split
end

# List of hashmaps where: key = length of pattern, value = list of patterns 
entries = patterns.map do |entry|
    entry.group_by do |pattern|
        pattern.length
    end
end

# list of segments that represent the number on its index
$number_segments = [
    [0,1,2,4,5,6],
    [2,5],
    [0,2,3,4,6],
    [0,2,3,5,6],
    [1,2,3,5],
    [0,1,3,5,6],
    [0,1,3,4,5,6],
    [0,2,5],
    [0,1,2,3,4,5,6],
    [0,1,2,3,5,6]
]

def diff(s1, s2) 
    s1.split("").difference(s2.split("")).uniq.join
end

def intersect(s1, s2) 
    s1.split("").intersection(s2.split("")).uniq.join
end

def number_from_pattern(pattern, display)
    segments = pattern.split("").map do |char|
        display.key(char)
    end

    s = $number_segments.select { |s|
        segments.all? { |i| s.include?(i) } if s.length  == segments.length
    }.flatten

    $number_segments.index(s)
end

list_of_entry_outputs = entries.map.with_index do |patterns, idx|
    display = {
        0 => diff(patterns[3][0], patterns[2][0]), # diff between numbers: 1,7
        2 => patterns[2][0], # channels for number 1
        5 => patterns[2][0], # channels for number 1
        1 => diff(patterns[4][0], patterns[2][0]),
        3 => diff(patterns[4][0], patterns[2][0]),
        4 => diff(patterns[5][0]+patterns[5][1]+patterns[5][2] , patterns[4][0] + patterns[3][0]),
        6 => diff(patterns[5][0]+patterns[5][1]+patterns[5][2] , patterns[4][0] + patterns[3][0])
    }

    $display_final = { 0 => diff(patterns[3][0], patterns[2][0]) }

    patterns[5].each do |pattern|
        if pattern.include?(display[1][0]) && pattern.include?(display[1][1]) # number 5
            $display_final[5] = intersect(pattern, display[5])
            $display_final[2] = diff(display[2], $display_final[5])
            $display_final[6] = intersect(pattern, display[6])
            $display_final[4] = diff(display[4], $display_final[6])
        elsif pattern.include?(display[2][0]) && pattern.include?(display[2][1]) # number 3
            $display_final[3] = intersect(pattern, display[3])
            $display_final[1] = diff(display[1], $display_final[3])
            $display_final[6] = intersect(pattern, display[6])
            $display_final[4] = diff(display[4], $display_final[6])
        elsif pattern.include?(display[4][0]) && pattern.include?(display[4][1]) # number 2
            $display_final[2] = intersect(pattern, display[2])
            $display_final[5] = diff(display[5], $display_final[2])
            $display_final[3] = intersect(pattern, display[3])
            $display_final[1] = diff(display[1], $display_final[3])
        end
    end

    outputs[idx].map { |number|
        number_from_pattern(number, $display_final)
    }.join.to_i
end


p list_of_entry_outputs.sum
