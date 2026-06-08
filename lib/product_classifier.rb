# frozen_string_literal: true

class ProductClassifier
  # The challenge asks us to produce receipts for the provided shopping baskets,
  # so these category keywords are intentionally based on the sample basket items.
  # More exempt categories can be added here later if the input scope grows.
  EXEMPT_KEYWORDS = {
    books: %w[book books],
    food: %w[chocolate chocolates],
    medical: ['pills']
  }.freeze

  IMPORTED_KEYWORD = 'imported'

  def initialize(item)
    @item = item
  end

  def category
    EXEMPT_KEYWORDS.find do |_category, keywords|
      keywords.any? { |keyword| name.match?(/\b#{Regexp.escape(keyword)}\b/) }
    end&.first
  end

  def imported?
    name.match?(/\b#{Regexp.escape(IMPORTED_KEYWORD)}\b/)
  end

  def exempt?
    !category.nil?
  end

  private

  def name
    @item.name.downcase
  end
end
