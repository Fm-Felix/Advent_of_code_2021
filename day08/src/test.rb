patterns = []
outputs = []

input = ARGF.each_line do |line|
    line = line.chomp.split("|")
    patterns << line[0].split
    outputs << line[1].split
end

# List of hashmaps where: key = length of pattern, value = list of patterns 
# entries = patterns.map do |entry|
#     entry.group_by do |pattern|
#         pattern.length
#     end
# end

# Debug: one entry
entries = patterns[0].group_by do |pattern|
    pattern.length
end

    # patterns[6].each do |pattern|
    #     if !pattern.include?(display[3][0]) && !pattern.include?(display[3][1]) # number 0
    #         $display_final[1] = intersect(pattern, display[1])
    #         $display_final[3] = diff(display[3], $display_final[1])
    #         p 0
    #     elsif !pattern.include?(display[2][0]) && !pattern.include?(display[2][1]) # number 6
    #         $display_final[5] = intersect(pattern, display[5])
    #         $display_final[2] = diff(display[2], $display_final[5])
    #         p 6
    #     elsif !pattern.include?(display[4][0]) && !pattern.include?(display[4][1]) # number 9
    #         $display_final[6] = intersect(pattern, display[6])
    #         $display_final[4] = diff(display[4], $display_final[6])
    #         p 9
    #     end
    # end


unique_segments = [[1,5], [0,1,5], [1,2,3,5]]

# Each index represents a segment of the 7-segment display

def diff(s1, s2) 
    s1.split("").difference(s2.split("")).uniq.join
end

def intersect(s1, s2) 
    s1.split("").intersection(s2.split("")).uniq.join
end

p entries.sort.to_h






