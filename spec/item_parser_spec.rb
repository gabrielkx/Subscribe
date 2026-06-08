# frozen_string_literal: true

require_relative '../lib/item_parser'

RSpec.describe ItemParser do
  describe '.parse' do
    it 'parses all items from basket 1' do
      lines = [
        '2 book at 12.49',
        '1 music CD at 14.99',
        '1 chocolate bar at 0.85'
      ]

      items = lines.map { |line| described_class.parse(line) }

      expect(items[0].quantity).to eq(2)
      expect(items[0].name).to eq('book')
      expect(items[0].unit_price).to eq(12.49)

      expect(items[1].quantity).to eq(1)
      expect(items[1].name).to eq('music CD')
      expect(items[1].unit_price).to eq(14.99)

      expect(items[2].quantity).to eq(1)
      expect(items[2].name).to eq('chocolate bar')
      expect(items[2].unit_price).to eq(0.85)
    end

    it 'parses all items from basket 2' do
      lines = [
        '1 imported box of chocolates at 10.00',
        '1 imported bottle of perfume at 47.50'
      ]

      items = lines.map { |line| described_class.parse(line) }

      expect(items[0].quantity).to eq(1)
      expect(items[0].name).to eq('imported box of chocolates')
      expect(items[0].unit_price).to eq(10.00)

      expect(items[1].quantity).to eq(1)
      expect(items[1].name).to eq('imported bottle of perfume')
      expect(items[1].unit_price).to eq(47.50)
    end

    it 'parses all items from basket 3' do
      lines = [
        '1 imported bottle of perfume at 27.99',
        '1 bottle of perfume at 18.99',
        '1 packet of headache pills at 9.75',
        '3 imported boxes of chocolates at 11.25'
      ]

      items = lines.map { |line| described_class.parse(line) }

      expect(items[0].quantity).to eq(1)
      expect(items[0].name).to eq('imported bottle of perfume')
      expect(items[0].unit_price).to eq(27.99)

      expect(items[1].quantity).to eq(1)
      expect(items[1].name).to eq('bottle of perfume')
      expect(items[1].unit_price).to eq(18.99)

      expect(items[2].quantity).to eq(1)
      expect(items[2].name).to eq('packet of headache pills')
      expect(items[2].unit_price).to eq(9.75)

      expect(items[3].quantity).to eq(3)
      expect(items[3].name).to eq('imported boxes of chocolates')
      expect(items[3].unit_price).to eq(11.25)
    end
  end
end
