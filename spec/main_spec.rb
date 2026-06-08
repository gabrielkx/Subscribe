# frozen_string_literal: true

require 'open3'
require 'rbconfig'

RSpec.describe 'bin/main.rb' do
  it 'prints the expected receipt for input 1' do
    stdout, status = Open3.capture2(
      RbConfig.ruby,
      'bin/main.rb',
      'inputs/input_1.txt',
      chdir: File.expand_path('..', __dir__)
    )

    expect(status.success?).to eq(true)
    expect(stdout).to eq(
      "2 book: 24.98\n" \
      "1 music CD: 16.49\n" \
      "1 chocolate bar: 0.85\n" \
      "Sales Taxes: 1.50\n" \
      "Total: 42.32\n"
    )
  end

  it 'prints the expected receipt for input 2' do
    stdout, status = Open3.capture2(
      RbConfig.ruby,
      'bin/main.rb',
      'inputs/input_2.txt',
      chdir: File.expand_path('..', __dir__)
    )

    expect(status.success?).to eq(true)
    expect(stdout).to eq(
      "1 imported box of chocolates: 10.50\n" \
      "1 imported bottle of perfume: 54.65\n" \
      "Sales Taxes: 7.65\n" \
      "Total: 65.15\n"
    )
  end

  it 'prints the expected receipt for input 3' do
    stdout, status = Open3.capture2(
      RbConfig.ruby,
      'bin/main.rb',
      'inputs/input_3.txt',
      chdir: File.expand_path('..', __dir__)
    )

    expect(status.success?).to eq(true)
    expect(stdout).to eq(
      "1 imported bottle of perfume: 32.19\n" \
      "1 bottle of perfume: 20.89\n" \
      "1 packet of headache pills: 9.75\n" \
      "3 imported boxes of chocolates: 35.55\n" \
      "Sales Taxes: 7.90\n" \
      "Total: 98.38\n"
    )
  end
end
