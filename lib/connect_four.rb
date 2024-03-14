# frozen_string_literal: true

require_relative "connect_four/display"
require_relative "connect_four/game"

# "Connect Four" game, played in the terminal.
module ConnectFour
  WHITE_TOKEN = "\u25cf"
  BLACK_TOKEN = "\u25cb"

  def self.new
    Game.new
  end
end
