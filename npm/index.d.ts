declare module '@apiverve/gasprices' {
  export interface gaspricesOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface gaspricesResponse {
    status: string;
    error: string | null;
    data: GasPricesData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface GasPricesData {
      country:         null | string;
      countryName:     null | string;
      area:            null | string;
      areaName:        null | string;
      areaType:        null | string;
      week:            Date | null;
      currency:        null | string;
      unit:            null | string;
      prices:          Prices;
      changeDirection: null | string;
      previousWeek:    Date | null;
      weeklyChange:    Prices;
      yearAgoWeek:     Date | null;
      yearlyChange:    Prices;
      nativeCurrency:  null | string;
      nativeUnit:      null | string;
      exchangeRate:    number | null;
  }
  
  interface Prices {
      regular:   number | null;
      midgrade:  number | null;
      premium:   number | null;
      diesel:    number | null;
      allGrades: number | null;
      lpg:       null;
  }

  export default class gaspricesWrapper {
    constructor(options: gaspricesOptions);

    execute(callback: (error: any, data: gaspricesResponse | null) => void): Promise<gaspricesResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: gaspricesResponse | null) => void): Promise<gaspricesResponse>;
    execute(query?: Record<string, any>): Promise<gaspricesResponse>;
  }
}
