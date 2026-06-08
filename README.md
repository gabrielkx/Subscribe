# Sales Tax Challenge

## Requirements

- Ruby 4.0.5
- Bundler

## Setup

Install the project dependencies:

```bash
bundle install
```

## Run the Application

The application reads a basket from a text file.

Run any of the provided examples with:

```bash
ruby bin/main.rb inputs/input_1.txt
ruby bin/main.rb inputs/input_2.txt
ruby bin/main.rb inputs/input_3.txt
```

You can also add more input files under `inputs/` and run them in the same way.

## Run the Tests

```bash
bundle exec rspec
```

## Run RuboCop

```bash
bundle exec rubocop
```

## Project Structure

- `bin/main.rb`: application entrypoint
- `lib/item.rb`: item entity
- `lib/item_parser.rb`: parses one input line into an item
- `lib/product_classifier.rb`: determines whether an item is exempt or imported
- `lib/tax_calculator.rb`: calculates tax and final price
- `lib/receipt.rb`: builds the final receipt
- `inputs/`: sample basket files
- `spec/`: test suite

## Assumptions

- The application uses the input format provided in the challenge:
  `"<quantity> <product name> at <price>"`
- Exempt categories are identified from the sample baskets provided in the prompt.
- More exempt keyword examples can be added in `ProductClassifier::EXEMPT_KEYWORDS`
  if the input scope grows.
- The parser regex in `ItemParser::ITEM_LINE_PATTERN` can also be extended if future
  examples introduce a different line format.

  <img width="744" height="168" alt="image" src="https://github.com/user-attachments/assets/ea1a8ddf-8b4d-4749-bc0f-988902071530" />

