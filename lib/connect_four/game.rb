# frozen_string_literal: true

module ConnectFour
  class Game
    include Display

    def initialize
      @grid = Array.new(7) { Array.new(6) }
    end

    def full_grid?
      @grid.each { |column| return true unless column.any?(nil) }
      false
    end

    def winner
      vertical_winner || horizontal_winner || diagonal_winner
    end

    private

    def vertical_winner
      @grid.each do |column|
        white_combo = 0
        black_combo = 0
        column.each do |row|
          return WHITE_TOKEN if white_combo == 4
          return BLACK_TOKEN if black_combo == 4

          row == WHITE_TOKEN ? white_combo += 1 : white_combo = 0
          row == BLACK_TOKEN ? black_combo += 1 : black_combo = 0
        end
      end
      nil
    end

    def horizontal_winner
      6.times do |row|
        white_combo = 0
        black_combo = 0
        7.times do |column|
          return WHITE_TOKEN if white_combo == 4
          return BLACK_TOKEN if black_combo == 4

          @grid[column][row] == WHITE_TOKEN ? white_combo += 1 : white_combo = 0
          @grid[column][row] == BLACK_TOKEN ? black_combo += 1 : black_combo = 0
        end
      end
      nil
    end

    def diagonal_winner
      @grid.each_index do |column|
        @grid[column].each_index do |row|
          white_combo = 0
          black_combo = 0
          4.times do |i|
            break if @grid[column + i].nil? || @grid[column + i][row + i].nil?

            white_combo += 1 if @grid[column + i][row + i] == WHITE_TOKEN
            black_combo += 1 if @grid[column + i][row + i] == BLACK_TOKEN
          end
          return WHITE_TOKEN if white_combo == 4
          return BLACK_TOKEN if black_combo == 4
        end
      end
      nil
    end
  end
end
