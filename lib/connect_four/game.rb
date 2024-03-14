# frozen_string_literal: true

module ConnectFour
  class Game
    include Display

    attr_reader :player

    def initialize
      @grid = Array.new(7) { Array.new(6) }
      @player = WHITE_TOKEN
    end

    def player_choice
      choice = gets[/^\d/]
      return if choice.nil?

      choice = choice.to_i
      choice.between?(0, 6) ? choice : nil
    end

    def switch_players
      @player = @player == WHITE_TOKEN ? BLACK_TOKEN : WHITE_TOKEN
    end

    def full_grid?
      @grid.each { |column| return true unless column.any?(nil) }
      false
    end

    def winner
      @grid.each_with_index do |column, x|
        column.each_index do |y|
          token = @grid[x][y]
          next if token.nil?

          return token if find_combo(x, y, token)
        end
      end
      nil
    end

    private

    def find_combo(x, y, token)
      directions = [[1, 0], [0, 1], [1, 1], [1, -1]]
      directions.each do |dx, dy|
        combo = 1
        new_x = x + dx
        new_y = y + dy
        while combo < 4 && @grid[new_x] && @grid[new_x][new_y] == token
          combo += 1
          new_x += dx
          new_y += dy
        end
        return token if combo == 4
      end
      nil
    end
  end
end
