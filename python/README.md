Gas Prices API
============

Gas Prices returns average retail gasoline, diesel and LPG prices from official weekly government surveys for the US, the UK, all 27 EU countries and the EU average. Pass a country, or a US state, region or city, to get the latest week with week-over-week and year-over-year changes, in any currency, per liter or per gallon.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-gasprices.svg)](https://pypi.org/project/apiverve-gasprices/)

This is a Python wrapper for the [Gas Prices API](https://apiverve.com/marketplace/gasprices?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-gasprices
```

Using `pip3`:

```bash
pip3 install apiverve-gasprices
```

---

## Configuration

Before using the Gas Prices API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_gasprices.apiClient import GaspricesAPIClient

# Initialize the client with your APIVerve API key
api = GaspricesAPIClient("[YOUR_API_KEY]")

query = {
    "country": "US",
    "area": "CA",
    "currency": "USD",
    "unit": "liter",
    "date": "2024-06-15"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Gas Prices API documentation is found here: [https://docs.apiverve.com/ref/gasprices](https://docs.apiverve.com/ref/gasprices?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_gasprices.apiClient import GaspricesAPIClient

# Initialize the client with your APIVerve API key
api = GaspricesAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "country": "US",
    "area": "CA",
    "currency": "USD",
    "unit": "liter",
    "date": "2024-06-15"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `GaspricesAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_gasprices.apiClient import GaspricesAPIClient, GaspricesAPIClientError

api = GaspricesAPIClient("[YOUR_API_KEY]")

query = {
    "country": "US",
    "area": "CA",
    "currency": "USD",
    "unit": "liter",
    "date": "2024-06-15"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except GaspricesAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_gasprices.apiClient import GaspricesAPIClient, GaspricesAPIClientError

api = GaspricesAPIClient("[YOUR_API_KEY]")

query = {
    "country": "US",
    "area": "CA",
    "currency": "USD",
    "unit": "liter",
    "date": "2024-06-15"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except GaspricesAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_gasprices.apiClient import GaspricesAPIClient, GaspricesAPIClientError

query = {
    "country": "US",
    "area": "CA",
    "currency": "USD",
    "unit": "liter",
    "date": "2024-06-15"
}

# Using context manager ensures proper cleanup
with GaspricesAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except GaspricesAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_gasprices.apiClient import GaspricesAPIClient

# Enable debug mode
api = GaspricesAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "country": "US",
    "area": "CA",
    "currency": "USD",
    "unit": "liter",
    "date": "2024-06-15"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_gasprices.apiClient import GaspricesAPIClient

api = GaspricesAPIClient("[YOUR_API_KEY]")

query = {
    "country": "US",
    "area": "CA",
    "currency": "USD",
    "unit": "liter",
    "date": "2024-06-15"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
