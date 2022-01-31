import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/tokens#the-tokens-object
class TokenService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  TokenService({required this.baseUrl, required this.authenticationService});

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

    print(endpoint.toString());

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode({
          "card": card.toJson()
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return jsonDecode(response.body)["value"];
    } else {
      throw TokenException(
          statusCode: response.statusCode, message: response.body);
    }
  }

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

    print(endpoint.toString());

    var response = await http.post(endpoint,
        headers: headers, body: jsonEncode({
          "bankAccount": bankAccount.toJson()
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
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
