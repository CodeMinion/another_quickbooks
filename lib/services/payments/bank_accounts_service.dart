import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

///
/// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/bankaccounts
/// Store bank accounts for processing future payments.
/// Applicable for US only
///
class BankAccountsService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  BankAccountsService(
      {required this.baseUrl, required this.authenticationService});

  ///
  /// Creates a bank account
  ///
  Future<BankAccount> createAccount({
    required String requestId,
    required String customerId,
    required BankAccount account,
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


    //v4/customers/2/bank-accounts
    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/customers/$customerId/bank-accounts");

    //print (endpoint.toString());

    //print (jsonEncode(account.toJson()));
    var response = await
        http.post(endpoint, headers: headers, body: jsonEncode(account.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
        return BankAccount.fromJson(jsonDecode(response.body));
    }
    else {
      throw BankAccountException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// This operation allows you to store a new bank account object from a token.
  ///
  Future<BankAccount> createAccountFromToken({
    required String requestId,
    required String customerId,
    required String accountToken,
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
        baseUrl, "/quickbooks/v4/customers/$customerId/bank-accounts/createFromToken");

    //print (endpoint.toString());
    var response = await
    http.post(endpoint, headers: headers, body: jsonEncode({"value": accountToken}));

    if (response.statusCode == 200) {
      return BankAccount.fromJson(jsonDecode(response.body));
    }
    else {
      throw BankAccountException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Returns a list of up to ten bank accounts for the company specified
  /// with the id parameter. The accounts are returned in
  /// descending order with most recent accounts first.
  ///
  Future<List<BankAccount>> readAllAccounts({
    required String requestId,
    required String customerId,
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


    //v4/customers/2/bank-accounts
    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/customers/$customerId/bank-accounts");

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers,);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((e) => BankAccount.fromJson(e)).toList();
    }
    else {
      throw BankAccountException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves a specified BankAccount object.
  ///
  Future<BankAccount> readAccount({
    required String bankAccountId,
    required String customerId,
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
        baseUrl, "/quickbooks/v4/customers/$customerId/bank-accounts/$bankAccountId");

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers,);

    if (response.statusCode == 200) {
      return BankAccount.fromJson(jsonDecode(response.body));
    }
    else {
      throw BankAccountException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Deletes a specified BankAccount object.
  ///
  Future<bool> deleteAccount({
    required String requestId,
    required String bankAccountId,
    required String customerId,
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
        baseUrl, "/quickbooks/v4/customers/$customerId/bank-accounts/$bankAccountId");

    //print (endpoint.toString());

    var response = await
    http.delete(endpoint, headers: headers,);

    if (response.statusCode == 204) {
      return true;
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
