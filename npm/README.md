# Gas Prices API

Gas Prices returns average retail gasoline, diesel and LPG prices from official weekly government surveys for the US, the UK, all 27 EU countries and the EU average. Pass a country, or a US state, region or city, to get the latest week with week-over-week and year-over-year changes, in any currency, per liter or per gallon.

[![npm version](https://img.shields.io/npm/v/@apiverve/gasprices.svg)](https://www.npmjs.com/package/@apiverve/gasprices)

This is a JavaScript wrapper for the [Gas Prices API](https://apiverve.com/marketplace/gasprices?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/gasprices
```

Using yarn:
```shell
yarn add @apiverve/gasprices
```

---

## Configuration

Before using the Gas Prices API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Gas Prices API documentation is found here: [https://docs.apiverve.com/ref/gasprices](https://docs.apiverve.com/ref/gasprices?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const gaspricesAPI = require('@apiverve/gasprices');
const api = new gaspricesAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  country: "US",
  area: "CA",
  currency: "USD",
  unit: "liter",
  date: "2024-06-15"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  country: "US",
  area: "CA",
  currency: "USD",
  unit: "liter",
  date: "2024-06-15"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  country: "US",
  area: "CA",
  currency: "USD",
  unit: "liter",
  date: "2024-06-15"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
