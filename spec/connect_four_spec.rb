# frozen_string_literal: true

require_relative "../lib/connect_four"

describe ConnectFour do
  subject(:game) { described_class.new }
  let(:grid) { game.instance_variable_get(:@grid) }
  white = described_class::WHITE_TOKEN
  black = described_class::BLACK_TOKEN

  describe "#grid_full?" do
    context "if the grid is full" do
      it "returns true" do
        grid.each { |column| column.map! { true } }
        expect(game.grid_full?).to be true
      end
    end

    context "if the grid is not full" do
      it "returns false" do
        expect(game.grid_full?).to be false
      end
    end
  end

  describe "#column_full?(column)" do
    context "if the given column is full" do
      it "returns true" do
        6.times { |slot| grid[2][slot] = white }
        expect(game.column_full?(2)).to be true
      end
    end

    context "if the given column is not full" do
      it "returns false" do
        expect(game.column_full?(2)).to be false
      end
    end
  end

  describe "#winner" do
    it "returns #{white} when #{white} has 4 in a row vertically" do
      4.times { |i| grid[0][i] = white }
      expect(game.winner).to eq(white)
    end

    it "returns #{white} when #{white} has 4 in a row horizontally" do
      4.times { |i| grid[i][0] = white }
      expect(game.winner).to eq(white)
    end

    it "returns #{white} when #{white} has 4 in a row diagonally" do
      4.times { |i| grid[i][i] = white }
      expect(game.winner).to eq(white)
    end

    it "returns #{black} when #{black} has 4 in a row vertically" do
      4.times { |i| grid[0][i] = black }
      expect(game.winner).to eq(black)
    end

    it "returns #{black} when #{black} has 4 in a row horizontally" do
      4.times { |i| grid[i][0] = black }
      expect(game.winner).to eq(black)
    end

    it "returns #{black} when #{black} has 4 in a row diagonally" do
      4.times { |i| grid[i][i] = black }
      expect(game.winner).to eq(black)
    end

    it "returns nil when #{white} has 4 NOT in a row vertically" do
      2.times { |i| grid[0][i] = white }
      (3..4).each { |i| grid[0][i] = white }
      expect(game.winner).to be_nil
    end

    it "returns nil when #{white} has 4 NOT in a row horizontally" do
      2.times { |i| grid[i][0] = white }
      (3..4).each { |i| grid[i][0] = white }
      expect(game.winner).to be_nil
    end

    it "returns nil when #{white} has 4 NOT in a row diagonally" do
      2.times { |i| grid[i][i] = white }
      (3..4).each { |i| grid[i][i] = white }
      expect(game.winner).to be_nil
    end

    it "returns nil when #{black} has 4 NOT in a row vertically" do
      2.times { |i| grid[0][i] = black }
      (3..4).each { |i| grid[0][i] = black }
      expect(game.winner).to be_nil
    end

    it "returns nil when #{black} has 4 NOT in a row horizontally" do
      2.times { |i| grid[i][0] = black }
      (3..4).each { |i| grid[i][0] = black }
      expect(game.winner).to be_nil
    end

    it "returns nil when #{black} has 4 NOT in a row diagonally" do
      2.times { |i| grid[i][i] = black }
      (3..4).each { |i| grid[i][i] = black }
      expect(game.winner).to be_nil
    end

    it "returns nil when there are no winning combos" do
      expect(game.winner).to be_nil
    end
  end

  describe "#player_choice" do
    context "when the input is valid" do
      it "returns the input as an integer" do
        allow(game).to receive(:gets).and_return("5")
        expect(game.player_choice).to eq(5)
      end
    end

    context "when the input is invalid" do
      it "returns nil (input of 8)" do
        allow(game).to receive(:gets).and_return("8")
        expect(game.player_choice).to be_nil
      end

      it "returns nil (input of 'foo')" do
        allow(game).to receive(:gets).and_return("foo")
        expect(game.player_choice).to be_nil
      end

      it "returns nil (input of '')" do
        allow(game).to receive(:gets).and_return("")
        expect(game.player_choice).to be_nil
      end
    end
  end

  describe "#switch_players" do
    it "switches player from #{white} to #{black}" do
      game.switch_players unless game.player == black
      expect(game.player).to eq(black)
    end

    it "switches player from #{black} to #{white}" do
      game.switch_players unless game.player == white
      expect(game.player).to eq(white)
    end
  end
end
