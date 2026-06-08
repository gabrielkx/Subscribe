# frozen_string_literal: true

require_relative '../lib/item'
require_relative '../lib/tax_calculator'

RSpec.describe TaxCalculator do
  describe '#tax_rate' do
    it 'returns 0 for exempt local items' do
      item = Item.new(1, 'book', 12.49)

      calculator = described_class.new(item)

      expect(calculator.tax_rate).to eq(0)
    end

    it 'returns 0.10 for non-exempt local items' do
      item = Item.new(1, 'music CD', 14.99)

      calculator = described_class.new(item)

      expect(calculator.tax_rate).to eq(0.10)
    end

    it 'returns 0.05 for exempt imported items' do
      item = Item.new(1, 'imported box of chocolates', 10.00)

      calculator = described_class.new(item)

      expect(calculator.tax_rate).to eq(0.05)
    end

    it 'returns 0.15 for non-exempt imported items' do
      item = Item.new(1, 'imported bottle of perfume', 27.99)

      calculator = described_class.new(item)

      expect(calculator.tax_rate).to eq(0.15)
    end
  end

  describe '#tax_amount' do
    it 'rounds basic tax up to the nearest 0.05' do
      item = Item.new(1, 'music CD', 14.99)

      calculator = described_class.new(item)

      expect(calculator.tax_amount).to eq(1.50)
    end

    it 'rounds import duty up to the nearest 0.05' do
      item = Item.new(1, 'imported box of chocolates', 10.00)

      calculator = described_class.new(item)

      expect(calculator.tax_amount).to eq(0.50)
    end

    it 'applies quantity to the total tax amount' do
      item = Item.new(3, 'imported boxes of chocolates', 11.25)

      calculator = described_class.new(item)

      expect(calculator.tax_amount).to eq(1.80)
    end
  end

  describe '#total_price' do
    it 'returns the price including tax for one non-exempt imported item' do
      item = Item.new(1, 'imported bottle of perfume', 27.99)

      calculator = described_class.new(item)

      expect(calculator.total_price).to eq(32.19)
    end

    it 'returns the line total including tax for multiple items' do
      item = Item.new(2, 'book', 12.49)

      calculator = described_class.new(item)

      expect(calculator.total_price).to eq(24.98)
    end
  end
end
