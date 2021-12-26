input = ARGF.read
list_spawnings = input.split(",").map(&:to_i)

num_spawns = 80 / 6
extra_days = 80 % 6

num_extra_spawns_original_fish = list_spawnings.select{|f| f <= extra_days}.count
num_original_fish_spawns = num_spawns * list_spawnings.count + num_extra_spawns_original_fish




p num_spawns, extra_days, num_original_fish_spawns
