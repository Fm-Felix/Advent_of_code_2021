horizontal = 0
depth = 0
aim = 0

ARGF.each_line { |line|
    dir, value = line.split
    value = value.to_i

    case dir
    when "forward"
        horizontal += value
        depth += value * aim
    when "down"
        aim += value
    when "up" 
        aim -= value  
    end
}

puts horizontal * depth



