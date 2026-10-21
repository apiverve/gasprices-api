# Gas Prices API - PHP Package

Gas Prices returns average retail gasoline, diesel and LPG prices from official weekly government surveys for the US, the UK, all 27 EU countries and the EU average. Pass a country, or a US state, region or city, to get the latest week with week-over-week and year-over-year changes, in any currency, per liter or per gallon.

## Installation

Install via Composer:

```bash
composer require apiverve/gasprices
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Gasprices\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'country' => 'US',
    'area' => 'CA',
    'currency' => 'USD',
    'unit' => 'liter',
    'date' => '2024-06-15'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Gasprices\Client;
use APIVerve\Gasprices\Exceptions\APIException;
use APIVerve\Gasprices\Exceptions\ValidationException;

try {
    $response = $client->execute(['country' => 'US', 'area' => 'CA', 'currency' => 'USD', 'unit' => 'liter', 'date' => '2024-06-15']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/gasprices?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/gasprices?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/gasprices?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
