# Gas Prices API - Ruby Gem

Gas Prices returns average retail gasoline, diesel and LPG prices from official weekly government surveys for the US, the UK, all 27 EU countries and the EU average. Pass a country, or a US state, region or city, to get the latest week with week-over-week and year-over-year changes, in any currency, per liter or per gallon.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_gasprices'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_gasprices
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_gasprices'

# Initialize the client
client = APIVerve::Gasprices::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  country: "US",
  area: "CA",
  currency: "USD",
  unit: "liter",
  date: "2024-06-15"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ country: "US", area: "CA", currency: "USD", unit: "liter", date: "2024-06-15" })
  puts response["data"]
rescue APIVerve::Gasprices::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Gasprices::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Gasprices::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "country": "US",
    "countryName": "United States",
    "area": "US",
    "areaName": "United States",
    "areaType": "national",
    "week": "2026-09-28",
    "currency": "USD",
    "unit": "gallon",
    "prices": {
      "regular": 4.465,
      "midgrade": 5.073,
      "premium": 5.482,
      "diesel": 6.382,
      "allGrades": 4.603,
      "lpg": null
    },
    "changeDirection": "down",
    "previousWeek": "2026-09-21",
    "weeklyChange": {
      "regular": -0.013,
      "midgrade": 0.012,
      "premium": 0.022,
      "diesel": -0.147,
      "allGrades": -0.007,
      "lpg": null
    },
    "yearAgoWeek": "2025-09-29",
    "yearlyChange": {
      "regular": 1.347,
      "midgrade": 1.366,
      "premium": 1.415,
      "diesel": 2.628,
      "allGrades": 1.355,
      "lpg": null
    },
    "nativeCurrency": "USD",
    "nativeUnit": "gallon",
    "exchangeRate": 1
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/gasprices?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/gasprices?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/gasprices?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
