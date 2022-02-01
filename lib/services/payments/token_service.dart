import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

///
/// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/tokens#the-tokens-object
/// An opaque container that encapsulates a cardholder's credit card
/// information or bank account information.
/// Of note:
/// - This is a one time token with 15 minute long life span.
/// - A given token can only be used for one charges transaction.
/// You must create a new token prior to each charges transaction.
///
// For the app to avoid PCI compliance requirements, it needs to exchange
/// card info to a token BEFORE the the card info reaches the app server.
/// For example, it can get the token by calling the token create endpoint
/// from the JavaScript running in the browser, then pass the token to the
/// backend server for sequent calls to charges endpoints.
/// Applications that access cardholder information using the
/// Payments API are required to follow the payment application
/// data security standard (PA DSS) established by the payment card
/// industry, which specifies how cardholder data must be protected.
/// As such, the token resource provides a programatic way to comply
/// with this standard without having to hold sensitive card information
/// on your own servers. For details on this requirement, please refer to
/// the Payment Card Industry (PCI) Security Standards Council
/// website at https://www.pcisecuritystandards.org/
///
class TokenService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  TokenService({required this.baseUrl, required this.authenticationService});

  ///
  /// Creates a token for the specified card.
  ///
  Future<String> createCardToken({
    required String requestId,
    required Card card,
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

    Uri endpoint = Uri.https(baseUrl, "/quickbooks/v4/payments/tokens");

    //print(endpoint.toString());

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode({
          "card": card.toJson()
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      //print(response.body);
      return jsonDecode(response.body)["value"];
    } else {
      throw TokenException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Creates a token for the specified bank account.
  ///
  Future<String> createBankAccountToken({
    required String requestId,
    required BankAccount bankAccount,
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

    Uri endpoint = Uri.https(baseUrl, "/quickbooks/v4/payments/tokens");

    //print(endpoint.toString());

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode({
          "bankAccount": bankAccount.toJson()
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      //print(response.body);
      return jsonDecode(response.body)["value"];
    } else {
      throw TokenException(
          statusCode: response.statusCode, message: response.body);
    }
  }

}

class TokenException implements Exception {
  final String? message;
  final int statusCode;

  TokenException({required this.statusCode, this.message});

  @override
  String toString() {
    return "TokenException: $statusCode - $message";
  }
}
