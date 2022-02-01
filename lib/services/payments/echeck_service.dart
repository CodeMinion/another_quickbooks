import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

///
/// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/echecks
/// Send and receive payments using EChecks.
/// Applicable for US only
///
class ECheckService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  ECheckService({required this.baseUrl, required this.authenticationService});

  ///
  /// To process an E-check, you create a new debit object.
  ///
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

    //print(endpoint.toString());

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode(echeck.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
      //print(response.body);
      return ECheck.fromJson(jsonDecode(response.body));
    } else {
      throw ECheckException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of an ECheck refund transaction that has
  /// been previously created. The id of a previously created
  /// ECheck refund must be provided.
  ///
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

    //print(endpoint.toString());

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

  ///
  /// Retrieves the details of an echeck transaction that has been
  /// previously created. Supply the id as returned in the
  /// echecks response body from the previous create operation.
  ///
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

    //print(endpoint.toString());

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

  ///
  /// Full or partial refund an existing ECheck transaction.
  /// Refund requests made on the same day as the associated
  /// debit request may result in the transaction being voided.
  /// Refunds cannot be issued unless the original debit has succeeded
  /// (this process typically takes approximately three business days).
  ///
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

    //print(endpoint.toString());

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
