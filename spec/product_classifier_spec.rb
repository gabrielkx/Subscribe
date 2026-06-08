# frozen_string_literal: true

require_relative '../lib/item'
require_relative '../lib/product_classifier'

RSpec.describe ProductClassifier do
  describe '#category' do
    it 'returns books for book items' do
      item = Item.new(2, 'book', 12.49)

      classifier = described_class.new(item)

      expect(classifier.category).to eq(:books)
    end

    it 'returns food for chocolate items' do
      item = Item.new(1, 'imported box of chocolates', 10.00)

      classifier = described_class.new(item)

      expect(classifier.category).to eq(:food)
    end

    it 'returns medical for pills items' do
      item = Item.new(1, 'packet of headache pills', 9.75)

      classifier = described_class.new(item)

      expect(classifier.category).to eq(:medical)
    end

    it 'returns nil for non-exempt items' do
      item = Item.new(1, 'music CD', 14.99)

      classifier = described_class.new(item)

      expect(classifier.category).to be_nil
    end
  end

  describe '#imported?' do
    it 'returns true for imported items' do
      item = Item.new(1, 'imported bottle of perfume', 27.99)

      classifier = described_class.new(item)

      expect(classifier.imported?).to eq(true)
    end

    it 'returns false for local items' do
      item = Item.new(1, 'bottle of perfume', 18.99)

      classifier = described_class.new(item)

      expect(classifier.imported?).to eq(false)
    end
  end

  describe '#exempt?' do
    it 'returns true for exempt items' do
      item = Item.new(1, 'chocolate bar', 0.85)

      classifier = described_class.new(item)

      expect(classifier.exempt?).to eq(true)
    end

    it 'returns false for taxable items' do
      item = Item.new(1, 'music CD', 14.99)

      classifier = described_class.new(item)

      expect(classifier.exempt?).to eq(false)
    end
  end
end
