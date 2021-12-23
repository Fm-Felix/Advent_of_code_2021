input = ARGF.read
lines = input.split("\n")

lines_per_board = 6 # including whiteline
line_offset = 2
num_boards = lines.count / lines_per_board

boards = num_boards.times.map do |idx|
    idx *= lines_per_board
    idx += line_offset
    
    lines[idx, lines_per_board - 1].map(&:split).map { |row| row.map(&:to_i) }
end

numbers = lines[0].split(",").map(&:to_i)

def draw_numbers (numbers, boards)
    drawn = []

    numbers.each do |draw|
        drawn << draw
    
        boards.each do |board|
            board.each do |row|
                return [draw, drawn, board, row] if row.all? { |num| drawn.any?(num) }
            end 

            board.transpose.each do |col|
                return [draw, board, col] if col.all? { |num| drawn.any?(num) }
            end
        end
    end    
end

winning_draw, drawn, winning_board, winning_seq = draw_numbers(numbers, boards)

sum_non_drawn = winning_board.flatten.difference(drawn).sum

puts winning_board.to_s	
puts winning_seq.to_s	
puts winning_draw.to_s	
puts sum_non_drawn * winning_draw