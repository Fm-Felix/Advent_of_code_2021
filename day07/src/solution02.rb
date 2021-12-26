input = ARGF.read
h1 = {0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0}
h2 = input.split(",").map(&:to_i).tally
hash_spawnings = h1.merge(h2) { |k, ov, nv| ov + nv } 

256.times do 
    spawned = 0
    hash_spawnings.each do |days_til_spawn, num_spawns|
        if days_til_spawn == 0
            spawned += num_spawns
        else
            # move fishes spawn-counter down one step
            hash_spawnings[days_til_spawn - 1] += num_spawns 
            hash_spawnings[days_til_spawn] -= num_spawns
        end
    end
    hash_spawnings[8] += spawned # add new fishes
    hash_spawnings[6] += spawned # reset timer of fishes that spawned
    hash_spawnings[0] -= spawned
end

p hash_spawnings.sum { |k, v| v  }
