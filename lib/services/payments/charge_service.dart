import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/charges#capture-charge-funds
class ChargeService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  ChargeService({required this.baseUrl, required this.authenticationService});

  Future<Charge> createCharge({
    required String requestId,
    required Charge charge,
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

    Uri endpoint = Uri.https(baseUrl, "/quickbooks/v4/payments/charges");

    print(endpoint.toString());

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode(charge.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw ChargeException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Charge> readCharge({
    required String chargeId,
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
        Uri.https(baseUrl, "/quickbooks/v4/payments/charges/$chargeId");

    print(endpoint.toString());

    var response = await http.get(
      endpoint,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw ChargeException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Charge> readRefund({
    required String chargeId,
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

    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/payments/charges/$chargeId/refunds/$refundId");

    print(endpoint.toString());

    var response = await http.get(
      endpoint,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw ChargeException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Charge> refundCharge({
    required String requestId,
    required String chargeId,
    required String amount,
    String? description,
    PaymentContext? context,
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

    Uri endpoint =
        Uri.https(baseUrl, "/quickbooks/v4/payments/charges/$chargeId/refunds");

    print(endpoint.toString());

    var charge = Charge(
        id: chargeId,
        amount: amount,
        context: context,
        description: description);

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode(charge.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw ChargeException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Charge> captureCharge({
    required String requestId,
    required String chargeId,
    required String amount,
    String? description,
    PaymentContext? context,
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

    Uri endpoint =
        Uri.https(baseUrl, "/quickbooks/v4/payments/charges/$chargeId/capture");

    print(endpoint.toString());

    var charge = Charge(
        amount: amount,
        context: context,
        description: description);

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode(charge.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print (response.body);
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw ChargeException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Charge> voidTransaction({
    required String requestId,
    required String chargeRequestId,
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
        baseUrl, "/quickbooks/v4/payments/txn-requests/$chargeRequestId/void");

    print(endpoint.toString());

    var response = await http.post(endpoint, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw ChargeException(
          statusCode: response.statusCode, message: response.body);
    }
  }
}

class ChargeException implements Exception {
  final String? message;
  final int statusCode;

  ChargeException({required this.statusCode, this.message});

  @override
  String toString() {
    return "ChargeException: $statusCode - $message";
  }
}
