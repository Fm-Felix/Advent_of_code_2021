input = ARGF.read
lines = input.gsub(/->/, "").split.map { |x| x.split(",").map(&:to_i) }

vert = []
horiz = []
diag = []

[*0..(lines.count / 2) - 1].each do |idx|
    idx *= 2 # offset to create sliding window
    p1, p2 = lines[idx, 2]
    if p1[0] == p2[0]
        vert << [p1,p2]
    elsif p1[1] == p2[1]
        horiz << [p1,p2]
    elsif (p1[0] - p2[0]).abs == (p1[1] - p2[1]).abs 
        diag << [p1,p2]
    end
end

positions = []
positions += vert.map { |line| 
    f,s = line[0, 2]
    numbers = f[1] < s[1] ? [*f[1]..s[1]] : [*s[1]..f[1]]
    numbers.map { |x| [f[0],x] } # create array of positions between f[1] -> s[1]
}

positions += horiz.map { |line| 
    f,s = line[0, 2]
    numbers = f[0] < s[0] ? [*f[0]..s[0]] : [*s[0]..f[0]]
    numbers.map { |x| [x, f[1]] } # create array of positions between f[0] -> s[0]
}

positions += diag.map { |line| 
    f,s = line[0, 2]
    numbers_x = f[0] < s[0] ? (f[0]..s[0]).step(1) : (f[0]..s[0]).step(-1)
    numbers_y = f[1] < s[1] ? (f[1]..s[1]).step(1) : (f[1]..s[1]).step(-1)

    numbers = []
    loop do n1, n2 = numbers_x.next, numbers_y.next
        numbers << [n1, n2]
    end
    numbers
}

p positions.flatten(1).tally.select { |k,v| v >= 2}.count
