input = ARGF.read
lines = input.gsub(/->/, "").split.map { |x| x.split(",").map(&:to_i) }

vert = []
horiz = []

[*0..(lines.count / 2) - 1].each do |idx|
    idx *= 2 # offset to create sliding window
    line = lines[idx, 2]
    if line[0][0] == line[1][0]
        vert << line
    elsif line[0][1] == line[1][1]
        horiz << line
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

p positions.flatten(1).tally.select { |k,v| v >= 2}.count
