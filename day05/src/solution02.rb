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
    seq = nil

    numbers.each do |draw|
        drawn << draw
        board_r = nil

        boards.each do |board|
            board_r = board

            board.each do |row|
                boards.delete(board) if row.all? { |num| drawn.any?(num) }
            end 

            board.transpose.each do |col|
                boards.delete(board) if col.all? { |num| drawn.any?(num) }
            end
        end

        return [draw, drawn, board_r] if boards.count == 0
    end    
end

losing_draw, drawn, losing_board = draw_numbers(numbers, boards)
sum_non_drawn = losing_board.flatten.difference(drawn).sum
puts sum_non_drawn * losing_draw