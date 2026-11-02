import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class GaspricesValidationException implements Exception {
  final List<String> errors;

  GaspricesValidationException(this.errors);

  @override
  String toString() => 'GaspricesValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Gas Prices API client.
///
/// For more information, visit: https://apiverve.com/marketplace/gasprices?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [country] - Country to get prices for: US, GB, EU (the EU average) or any EU member code such as DE, FR or PL. Defaults to US. Countries other than US require a paid plan.
/// * [area] - US only: a state code (CA, CO, FL, MA, MN, NY, OH, TX, WA), a region (eastcoast, midwest, gulfcoast, rockymountain, westcoast and the PADD 1 sub-regions) or a city (losangeles, chicago, houston, newyorkcity and more). Omit for the national average. Requires a paid plan.
/// * [currency] - Currency to return prices in, as an ISO code (e.g. USD, EUR, GBP). Defaults to the country's own currency. [minLength: 3, maxLength: 3]
/// * [unit] - Volume unit to price per: liter or gallon. Defaults to the source's unit (gallon for the US, liter elsewhere).
/// * [date] - Date to look up (YYYY-MM-DD). Returns the survey week in effect on that date. Omit for the latest week. [format: date]
class GaspricesClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'country': ValidationRule(type: 'string', required: false),
    'area': ValidationRule(type: 'string', required: false),
    'currency': ValidationRule(type: 'string', required: false, minLength: 3, maxLength: 3),
    'unit': ValidationRule(type: 'string', required: false),
    'date': ValidationRule(type: 'string', required: false, format: 'date'),
  };

  GaspricesClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/gasprices',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [GaspricesValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw GaspricesValidationException(errors);
    }
  }

  /// Execute a request to the Gas Prices API.
  ///
  /// Parameters are validated before sending the request.
  Future<GaspricesResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw GaspricesException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return GaspricesResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw GaspricesException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw GaspricesException('Resource not found');
      } else {
        throw GaspricesException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is GaspricesException) rethrow;
      throw GaspricesException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Gas Prices API client.
class GaspricesException implements Exception {
  final String message;

  GaspricesException(this.message);

  @override
  String toString() => 'GaspricesException: $message';
}
