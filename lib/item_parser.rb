# frozen_string_literal: true

require_relative 'item'

class ItemParser
  # \A and \z anchor the match to the whole line.
  # (\d+) captures the quantity as one or more digits.
  # \s+ matches one or more spaces between sections.
  # (.+) captures the full item name.
  # (\d+\.\d{2}) captures a price like 14.99.
  # This pattern can be extended if future input examples use a different format.
  ITEM_LINE_PATTERN = /\A(\d+)\s+(.+)\s+at\s+(\d+\.\d{2})\z/

  def self.parse(line)
    match = line.match(ITEM_LINE_PATTERN)

    Item.new(
      match[1].to_i,
      match[2],
      match[3].to_f
    )
  end
end
