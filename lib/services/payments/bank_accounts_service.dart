import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/bankaccounts
class BankAccountsService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  BankAccountsService(
      {required this.baseUrl, required this.authenticationService});

  /// TODO See why we are getting invalid request.
  /// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/bankaccounts
  /// Creates a bank account
  Future<BankAccount> createAccount({
    required String requestId,
    required String customerId,
    required String name,
    required String accountNumber,
    required String phone,
    required BankAccountTypeEnum accountType,
    required String routingNumber,
    bool? isDefault,
    String? country,
    String? bankCode,
    String? inputType,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "request-Id": requestId,
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json; charset=UTF-8',
    };

    Map<String, String> params = {
      "id": customerId
    };

    BankAccount account = BankAccount(
      name: name,
      country: country,
      accountType: accountType,
      accountNumber: accountNumber,
      bankCode: bankCode,
      isDefault: isDefault,
      inputType: inputType,
      phone: phone,
      routingNumber: routingNumber,
    );

    Uri endpoint = Uri.https(
        baseUrl, "/v4/customers/$realmId/bank-accounts", params);

    print (endpoint.toString());

    var response = await
        http.post(endpoint, headers: headers, body: jsonEncode(account.toJson()));

    if (response.statusCode == 200) {
        return BankAccount.fromJson(jsonDecode(response.body));
    }
    else {
      throw BankAccountException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class BankAccountException implements Exception {
  final String? message;
  final int statusCode;

  BankAccountException({required this.statusCode, this.message});

  @override
  String toString() {
    return "BankAccountException: $statusCode - $message";
  }
}
