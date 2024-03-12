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
end
