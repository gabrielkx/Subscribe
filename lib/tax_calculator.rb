# frozen_string_literal: true

require_relative 'product_classifier'

class TaxCalculator
  BASIC_TAX_RATE = 0.10
  IMPORT_DUTY_RATE = 0.05

  def initialize(item)
    @item = item
    @classifier = ProductClassifier.new(item)
  end

  def tax_rate
    rate = 0.0
    rate += BASIC_TAX_RATE unless @classifier.exempt?
    rate += IMPORT_DUTY_RATE if @classifier.imported?
    rate.round(2)
  end

  def tax_amount
    (round_up_to_nearest_five_cents(@item.unit_price * tax_rate) * @item.quantity).round(2)
  end

  def total_price
    ((@item.unit_price * @item.quantity) + tax_amount).round(2)
  end

  private

  def round_up_to_nearest_five_cents(amount)
    ((amount / IMPORT_DUTY_RATE).ceil * IMPORT_DUTY_RATE).round(2)
  end
end
