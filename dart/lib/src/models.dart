/// Response models for the Gas Prices API.

/// API Response wrapper.
class GaspricesResponse {
  final String status;
  final dynamic error;
  final GaspricesData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  GaspricesResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory GaspricesResponse.fromJson(Map<String, dynamic> json) => GaspricesResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? GaspricesData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Gas Prices API.

class GaspricesData {
  String? country;
  String? countryName;
  String? area;
  String? areaName;
  String? areaType;
  String? week;
  String? currency;
  String? unit;
  GaspricesDataPrices? prices;
  String? changeDirection;
  String? previousWeek;
  GaspricesDataWeeklychange? weeklyChange;
  String? yearAgoWeek;
  GaspricesDataYearlychange? yearlyChange;
  String? nativeCurrency;
  String? nativeUnit;
  num? exchangeRate;

  GaspricesData({
    this.country,
    this.countryName,
    this.area,
    this.areaName,
    this.areaType,
    this.week,
    this.currency,
    this.unit,
    this.prices,
    this.changeDirection,
    this.previousWeek,
    this.weeklyChange,
    this.yearAgoWeek,
    this.yearlyChange,
    this.nativeCurrency,
    this.nativeUnit,
    this.exchangeRate,
  });

  factory GaspricesData.fromJson(Map<String, dynamic> json) => GaspricesData(
      country: json['country'],
      countryName: json['countryName'],
      area: json['area'],
      areaName: json['areaName'],
      areaType: json['areaType'],
      week: json['week'],
      currency: json['currency'],
      unit: json['unit'],
      prices: json['prices'] != null ? GaspricesDataPrices.fromJson(json['prices']) : null,
      changeDirection: json['changeDirection'],
      previousWeek: json['previousWeek'],
      weeklyChange: json['weeklyChange'] != null ? GaspricesDataWeeklychange.fromJson(json['weeklyChange']) : null,
      yearAgoWeek: json['yearAgoWeek'],
      yearlyChange: json['yearlyChange'] != null ? GaspricesDataYearlychange.fromJson(json['yearlyChange']) : null,
      nativeCurrency: json['nativeCurrency'],
      nativeUnit: json['nativeUnit'],
      exchangeRate: json['exchangeRate'],
    );
}

class GaspricesDataPrices {
  num? regular;
  num? midgrade;
  num? premium;
  num? diesel;
  num? allGrades;
  dynamic lpg;

  GaspricesDataPrices({
    this.regular,
    this.midgrade,
    this.premium,
    this.diesel,
    this.allGrades,
    this.lpg,
  });

  factory GaspricesDataPrices.fromJson(Map<String, dynamic> json) => GaspricesDataPrices(
      regular: json['regular'],
      midgrade: json['midgrade'],
      premium: json['premium'],
      diesel: json['diesel'],
      allGrades: json['allGrades'],
      lpg: json['lpg'],
    );
}

class GaspricesDataWeeklychange {
  num? regular;
  num? midgrade;
  num? premium;
  num? diesel;
  num? allGrades;
  dynamic lpg;

  GaspricesDataWeeklychange({
    this.regular,
    this.midgrade,
    this.premium,
    this.diesel,
    this.allGrades,
    this.lpg,
  });

  factory GaspricesDataWeeklychange.fromJson(Map<String, dynamic> json) => GaspricesDataWeeklychange(
      regular: json['regular'],
      midgrade: json['midgrade'],
      premium: json['premium'],
      diesel: json['diesel'],
      allGrades: json['allGrades'],
      lpg: json['lpg'],
    );
}

class GaspricesDataYearlychange {
  num? regular;
  num? midgrade;
  num? premium;
  num? diesel;
  num? allGrades;
  dynamic lpg;

  GaspricesDataYearlychange({
    this.regular,
    this.midgrade,
    this.premium,
    this.diesel,
    this.allGrades,
    this.lpg,
  });

  factory GaspricesDataYearlychange.fromJson(Map<String, dynamic> json) => GaspricesDataYearlychange(
      regular: json['regular'],
      midgrade: json['midgrade'],
      premium: json['premium'],
      diesel: json['diesel'],
      allGrades: json['allGrades'],
      lpg: json['lpg'],
    );
}

class GaspricesRequest {
  String? country;
  String? area;
  String? currency;
  String? unit;
  String? date;

  GaspricesRequest({
    this.country,
    this.area,
    this.currency,
    this.unit,
    this.date,
  });

  Map<String, dynamic> toJson() => {
      if (country != null) 'country': country,
      if (area != null) 'area': area,
      if (currency != null) 'currency': currency,
      if (unit != null) 'unit': unit,
      if (date != null) 'date': date,
    };
}
