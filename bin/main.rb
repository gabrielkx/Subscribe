# frozen_string_literal: true

require_relative '../lib/item_parser'
require_relative '../lib/receipt'

if ARGV.empty?
  warn 'Usage: ruby bin/main.rb path/to/input.txt'
  exit 1
end

lines = File.readlines(ARGV[0], chomp: true).reject(&:empty?)
items = lines.map { |line| ItemParser.parse(line) }

puts Receipt.new(items)
