$data = [] #Array of 12-bit-sequences

ARGF.each_line { |line|
    $data << line.chomp.chars.map {|c| c.to_i} # populate data array
}

def most_common_bit (d, i)
    bits = d.map{ |line| line[i] }
    ones = bits.count(1)
    zeroes = bits.count(0)

    if ones == zeroes
        1
    elsif ones < zeroes
        0
    else
        1
    end
end

def least_common_bit (d, i)
    bits = d.map{ |line| line[i] }
    ones = bits.count(1)
    zeroes = bits.count(0)

    if ones == zeroes
        0
    elsif ones < zeroes
        1
    else
        0
    end
end

o_g_r = $data.map(&:clone)
c_s_v = $data.map(&:clone)
for i in 0..$data[0].length - 1 do
    o_g_r_inter = o_g_r.select { |line| line[i] == most_common_bit(o_g_r, i) } 
    if o_g_r_inter.empty?
        break
    else
        o_g_r = o_g_r_inter
    end
end

for i in 0..$data[0].length - 1 do
    c_s_v_inter = c_s_v.select { |line| line[i] == least_common_bit(c_s_v, i) } 
    if c_s_v_inter.empty?
        break
    else
        c_s_v = c_s_v_inter
    end

end
puts o_g_r.join.to_i(2) * c_s_v.join.to_i(2)



