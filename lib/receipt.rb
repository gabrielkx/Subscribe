# frozen_string_literal: true

require_relative 'tax_calculator'

class Receipt
  def initialize(items)
    @items = items
  end

  def to_s
    [*receipt_lines, sales_taxes_line, total_line].join("\n")
  end

  def sales_taxes
    @items.sum { |item| TaxCalculator.new(item).tax_amount }
  end

  def total
    @items.sum { |item| TaxCalculator.new(item).total_price }
  end

  private

  def receipt_lines
    @items.map do |item|
      calculator = TaxCalculator.new(item)
      "#{item.quantity} #{item.name}: #{format('%.2f', calculator.total_price)}"
    end
  end

  def sales_taxes_line
    "Sales Taxes: #{format('%.2f', sales_taxes)}"
  end

  def total_line
    "Total: #{format('%.2f', total)}"
  end
end
