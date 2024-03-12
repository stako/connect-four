# frozen_string_literal: true

require_relative "../lib/connect_four"

describe ConnectFour do
  subject(:game) { described_class.new }

  describe "#full_grid?" do
    let(:grid) { game.instance_variable_get(:@grid) }

    it "returns true if grid is completely filled" do
      grid.each { |column| column.map! { true } }
      expect(game.full_grid?).to be true
    end

    it "returns false if grid has any empty slots" do
      expect(game.full_grid?).to be false
    end
  end

  describe "#winner" do
    xit "returns #{described_class::WHITE_TOKEN} if #{described_class::WHITE_TOKEN} has won" do
      expect(game.winner).to eq(described_class::WHITE_TOKEN)
    end

    xit "returns #{described_class::BLACK_TOKEN} if #{described_class::BLACK_TOKEN} has won" do
      expect(game.winner).to eq(described_class::BLACK_TOKEN)
    end

    xit "returns nil if there is no winner" do
      expect(game.winner).to be_nil
    end
  end
end
