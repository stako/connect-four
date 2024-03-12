# frozen_string_literal: true

module ConnectFour
  module Display
    def print_grid
      6.times do |row|
        print_row(row)
        row == 5 ? print_bottom : print_divider
      end
    end

    def print_row(row)
      box_vertical = "\u2502 "
      value = "\u25cf" # placeholder white circle
      string = box_vertical
      7.times { string += "#{value} #{box_vertical}" }

      puts string
    end

    def print_divider
      box_horiz = "\u2500" * 3
      box_cross = "\u253c"
      box_left = "\u251c"
      box_right = "\u2524"

      string = box_left + box_horiz
      6.times { string += box_cross + box_horiz }
      puts string + box_right
    end

    def print_bottom
      box_horiz = "\u2500" * 3
      box_div = "\u2534"
      box_bl_corner = "\u2514"
      box_br_corner = "\u2518"

      string = box_bl_corner + box_horiz
      6.times { string += box_div + box_horiz }
      puts string + box_br_corner
      7.times { |col| print "  #{col} " }
      puts
    end
  end
end
