# frozen_string_literal: true

require_relative "../lib/connect_four"

describe ConnectFour do
  subject(:game) { described_class.new }
  let(:grid) { game.instance_variable_get(:@grid) }

  describe "#full_grid?" do
    it "returns true if grid is completely filled" do
      grid.each { |column| column.map! { true } }
      expect(game.full_grid?).to be true
    end

    it "returns false if grid has any empty slots" do
      expect(game.full_grid?).to be false
    end
  end

  describe "#winner" do
    white = described_class::WHITE_TOKEN
    black = described_class::BLACK_TOKEN

    it "returns #{white} when #{white} has 4 in a row vertically" do
      4.times { |i| grid[0][i] = white }
      expect(game.winner).to eq(white)
    end

    it "returns nil when #{white} has 4 NOT in a row vertically" do
      2.times { |i| grid[0][i] = white }
      (3..4).each { |i| grid[0][i] = white }
      expect(game.winner).to be_nil
    end

    it "returns #{white} when #{white} has 4 in a row horizontally" do
      4.times { |i| grid[i][0] = white }
      expect(game.winner).to eq(white)
    end

    it "returns nil when #{white} has 4 NOT in a row horizontally" do
      2.times { |i| grid[i][0] = white }
      (3..4).each { |i| grid[i][0] = white }
      expect(game.winner).to be_nil
    end

    it "returns #{white} when #{white} has 4 in a row diagonally" do
      4.times { |i| grid[i][i] = white }
      expect(game.winner).to eq(white)
    end

    it "returns nil when #{white} has 4 NOT in a row diagonally" do
      2.times { |i| grid[i][i] = white }
      (3..4).each { |i| grid[i][i] = white }
      expect(game.winner).to be_nil
    end

    it "returns #{black} when #{black} has 4 in a row vertically" do
      4.times { |i| grid[0][i] = black }
      expect(game.winner).to eq(black)
    end

    it "returns nil when #{black} has 4 NOT in a row vertically" do
      2.times { |i| grid[0][i] = black }
      (3..4).each { |i| grid[0][i] = black }
      expect(game.winner).to be_nil
    end

    it "returns #{black} when #{black} has 4 in a row horizontally" do
      4.times { |i| grid[i][0] = black }
      expect(game.winner).to eq(black)
    end

    it "returns nil when #{black} has 4 NOT in a row horizontally" do
      2.times { |i| grid[i][0] = black }
      (3..4).each { |i| grid[i][0] = black }
      expect(game.winner).to be_nil
    end

    it "returns #{black} when #{black} has 4 in a row diagonally" do
      4.times { |i| grid[i][i] = black }
      expect(game.winner).to eq(black)
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
      before do
        allow(game).to receive(:gets).and_return("5")
      end

      it "sends a message to get user input once" do
        expect(game).to receive(:gets).once
        game.player_choice
      end

      it "returns the valid input as an integer" do
        expect(game.player_choice).to eq(5)
      end
    end

    context "when the first input is invalid, and second is valid" do
      before do
        allow(game).to receive(:gets).and_return("8", "5")
      end

      it "sends a message to get user input at least twice" do
        expect(game).to receive(:gets).at_least(:twice)
        game.player_choice
      end

      it "returns the valid input as an integer" do
        expect(game.player_choice).to eq(5)
      end
    end
  end
end
