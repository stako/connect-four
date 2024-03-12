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
  end
end
