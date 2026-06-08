# frozen_string_literal: true

class Item
  attr_reader :quantity, :name, :unit_price

  def initialize(quantity, name, unit_price)
    @unit_price = unit_price
    @name = name
    @quantity = quantity
  end
end
