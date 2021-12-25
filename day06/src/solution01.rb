input = ARGF.read
list_spawnings = input.split(",").map(&:to_i)

80.times do 
    new_spawns = []
    list_spawnings.each.with_index do |days_til_spawn, idx|
        if days_til_spawn == 0
            new_spawns << 8 # add new fish
            list_spawnings[idx] = 6 # reset spawn timer
        else
            list_spawnings[idx] -= 1 # reset spawn timer
        end  
    end
    list_spawnings += new_spawns
end

p list_spawnings.count