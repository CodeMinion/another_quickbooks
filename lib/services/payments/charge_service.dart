import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

///
/// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/charges#capture-charge-funds
/// Send and receive payments using credit cards and debit cards.
/// Applicable for US and Canada only
///
class ChargeService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  ChargeService({required this.baseUrl, required this.authenticationService});

  ///
  /// To charge a credit card, you create a new charge object.
  /// If your API key is in development mode, the supplied card
  /// won't actually be charged, though everything else will
  /// occur as if in production mode.
  ///
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

    //print(endpoint.toString());

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode(charge.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      //print(response.body);
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw ChargeException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of a charge that has been previously created.
  /// Supply the id as returned in the charges response
  /// body from the previous create operation.
  ///
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

    //print(endpoint.toString());

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

  ///
  /// Retrieve dull or partial refund.
  ///
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

    //print(endpoint.toString());

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

  ///
  /// Full or partial refund an existing charge.
  ///
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

    //print(endpoint.toString());

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

  ///
  /// Capture charge funds
  ///
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

    //print(endpoint.toString());

    var charge = Charge(
        amount: amount,
        context: context,
        description: description);

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode(charge.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      //print (response.body);
      return Charge.fromJson(jsonDecode(response.body));
    } else {
      throw ChargeException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Processes a void of a charge request that times out.
  /// It cannot be used to void a charge that has already been settled.
  /// Provide the request_id of the original charge as a query parameter.
  ///
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

    //print(endpoint.toString());

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
