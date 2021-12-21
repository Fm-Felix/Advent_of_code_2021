horizontal = 0
depth = 0

ARGF.each_line { |line|
    line = line.split
    case line[0]
    when "forward"
        horizontal += line[1].to_i
    when "down"
        depth += line[1].to_i
    when "up" 
        depth -= line[1].to_i  
    end
}

puts horizontal * depth



