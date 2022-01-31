import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/echecks
class ECheckService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  ECheckService({required this.baseUrl, required this.authenticationService});

  Future<ECheck> createDebit({
    required String requestId,
    required ECheck echeck,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Request-ID": requestId,
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };

    Uri endpoint = Uri.https(baseUrl, "/quickbooks/v4/payments/echecks");

    print(endpoint.toString());

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode(echeck.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return ECheck.fromJson(jsonDecode(response.body));
    } else {
      throw ECheckException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  Future<ECheck> readRefund({
    required String echeckId,
    required String refundId,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };

    Uri endpoint =
        Uri.https(baseUrl, "/quickbooks/v4/payments/echecks/$echeckId/refunds/$refundId");

    print(endpoint.toString());

    var response = await http.get(
      endpoint,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return ECheck.fromJson(jsonDecode(response.body));
    } else {
      throw ECheckException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  Future<ECheck> readECheck({
    required String echeckId,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };

    Uri endpoint =
    Uri.https(baseUrl, "/quickbooks/v4/payments/echecks/$echeckId");

    print(endpoint.toString());

    var response = await http.get(
      endpoint,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return ECheck.fromJson(jsonDecode(response.body));
    } else {
      throw ECheckException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  Future<ECheck> voidECheck({
    required String requestId,
    required String echeckId,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Request-ID": requestId,
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };

    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/payments/echecks/$echeckId/refunds");

    print(endpoint.toString());

    var response = await http.post(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ECheck.fromJson(jsonDecode(response.body));
    } else {
      throw ECheckException(
          statusCode: response.statusCode, message: response.body);
    }
  }
}

class ECheckException implements Exception {
  final String? message;
  final int statusCode;

  ECheckException({required this.statusCode, this.message});

  @override
  String toString() {
    return "ECheckException: $statusCode - $message";
  }
}
