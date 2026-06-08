# frozen_string_literal: true

require_relative '../lib/item'
require_relative '../lib/receipt'

RSpec.describe Receipt do
  describe '#to_s' do
    it 'prints the expected receipt for basket 1' do
      items = [
        Item.new(2, 'book', 12.49),
        Item.new(1, 'music CD', 14.99),
        Item.new(1, 'chocolate bar', 0.85)
      ]

      receipt = described_class.new(items)

      expect(receipt.to_s).to eq(
        "2 book: 24.98\n" \
        "1 music CD: 16.49\n" \
        "1 chocolate bar: 0.85\n" \
        "Sales Taxes: 1.50\n" \
        'Total: 42.32'
      )
    end

    it 'prints the expected receipt for basket 2' do
      items = [
        Item.new(1, 'imported box of chocolates', 10.00),
        Item.new(1, 'imported bottle of perfume', 47.50)
      ]

      receipt = described_class.new(items)

      expect(receipt.to_s).to eq(
        "1 imported box of chocolates: 10.50\n" \
        "1 imported bottle of perfume: 54.65\n" \
        "Sales Taxes: 7.65\n" \
        'Total: 65.15'
      )
    end

    it 'prints the expected receipt for basket 3' do
      items = [
        Item.new(1, 'imported bottle of perfume', 27.99),
        Item.new(1, 'bottle of perfume', 18.99),
        Item.new(1, 'packet of headache pills', 9.75),
        Item.new(3, 'imported boxes of chocolates', 11.25)
      ]

      receipt = described_class.new(items)

      expect(receipt.to_s).to eq(
        "1 imported bottle of perfume: 32.19\n" \
        "1 bottle of perfume: 20.89\n" \
        "1 packet of headache pills: 9.75\n" \
        "3 imported boxes of chocolates: 35.55\n" \
        "Sales Taxes: 7.90\n" \
        'Total: 98.38'
      )
    end
  end

  describe '#sales_taxes' do
    it 'returns the total sales taxes for a basket' do
      items = [
        Item.new(1, 'imported bottle of perfume', 27.99),
        Item.new(1, 'bottle of perfume', 18.99),
        Item.new(1, 'packet of headache pills', 9.75),
        Item.new(3, 'imported boxes of chocolates', 11.25)
      ]

      receipt = described_class.new(items)

      expect(receipt.sales_taxes).to eq(7.90)
    end
  end

  describe '#total' do
    it 'returns the final total for a basket' do
      items = [
        Item.new(2, 'book', 12.49),
        Item.new(1, 'music CD', 14.99),
        Item.new(1, 'chocolate bar', 0.85)
      ]

      receipt = described_class.new(items)

      expect(receipt.total).to eq(42.32)
    end
  end
end
