# frozen_string_literal: true

require_relative "connect_four/display"
require_relative "connect_four/game"

# "Connect Four" game, played in the terminal. (ConnectFour.new.play to begin)
module ConnectFour
  def self.new
    Game.new
  end
end
