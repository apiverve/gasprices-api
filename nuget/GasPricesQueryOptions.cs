using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.GasPrices
{
    /// <summary>
    /// Query options for the Gas Prices API
    /// </summary>
    public class GasPricesQueryOptions
    {
        /// <summary>
        /// Country to get prices for: US, GB, EU (the EU average) or any EU member code such as DE, FR or PL. Defaults to US. Countries other than US require a paid plan.
        /// </summary>
        [JsonProperty("country")]
        public string Country { get; set; }

        /// <summary>
        /// US only: a state code (CA, CO, FL, MA, MN, NY, OH, TX, WA), a region (eastcoast, midwest, gulfcoast, rockymountain, westcoast and the PADD 1 sub-regions) or a city (losangeles, chicago, houston, newyorkcity and more). Omit for the national average. Requires a paid plan.
        /// </summary>
        [JsonProperty("area")]
        public string Area { get; set; }

        /// <summary>
        /// Currency to return prices in, as an ISO code (e.g. USD, EUR, GBP). Defaults to the country's own currency.
        /// </summary>
        [JsonProperty("currency")]
        public string Currency { get; set; }

        /// <summary>
        /// Volume unit to price per: liter or gallon. Defaults to the source's unit (gallon for the US, liter elsewhere).
        /// </summary>
        [JsonProperty("unit")]
        public string Unit { get; set; }

        /// <summary>
        /// Date to look up (YYYY-MM-DD). Returns the survey week in effect on that date. Omit for the latest week.
        /// </summary>
        [JsonProperty("date")]
        public string Date { get; set; }
    }
}
