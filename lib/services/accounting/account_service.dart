
///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/account
/// Accounts are what businesses use to track transactions.
/// Accounts can track money coming in (income or revenue)
/// and going out (expenses). They can also track the value
/// of things (assets), like vehicles and equipment. There are
/// five basic account types: asset, liability, income, expense,
/// and equity. Accounts are part of the chart of accounts, the unique
/// list of accounts each business puts together to do their accounting.
/// Accountants often call accounts "ledgers". Learn more about accounts
/// and the chart of accounts. The account object is what you'll use to
/// do actions with the end-users accounts. Note: If you need to delete an
/// account, set the Active attribute to false in an object update request.
/// This makes it inactive. The account itself isn't permanently deleted,
/// but is hidden for display purposes. References to inactive objects
/// remain intact.
///
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

class AccountService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  AccountService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the results of the query.
  ///
  Future<List<Account>> queryAccount({
    required String query,
    String? realmId,
    String? authToken,
  }) async {

    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      //'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',

    };

    Map<String, String> params = {
      "query": query,
      "minorversion": minorVersion.toString()
    };


    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/query", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).account!;
    }
    else {
      throw AccountException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of an Account object that
  /// has been previously created.
  ///
  Future<Account> readAccount({
    required String accountId,
    String? realmId,
    String? authToken,
  }) async {

    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      //'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',

    };

    Map<String, String> params = {
      "minorversion": minorVersion.toString()
    };


    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/account/$accountId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Account.fromJson(jsonDecode(response.body)["Account"]);
    }
    else {
      throw AccountException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Creates an account
  /// Name must be unique.
  /// The Account.Name attribute must not contain double quotes (") or colon (:).
  /// The Account.AcctNum attribute must not contain a colon (:).
  ///
  Future<Account> createAccount({
    required Account account,

    String? realmId,
    String? authToken,
  }) async {

    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',

    };

    Map<String, String> params = {
      "minorversion": minorVersion.toString()
    };

    /*
    var account = Account(name: name, acctNum:acctNum,
        taxCodeRef: taxCodeRef,
        accountType: accountType,
        accountSubType: accountSubType );

     */

    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/account", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(account.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Account.fromJson(jsonDecode(response.body)["Account"]);
    }
    else {
      throw AccountException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Use this operation to update any of the writable
  /// fields of an existing account object.
  /// The request body must include all writable fields
  /// of the existing object as returned in a read response.
  /// Writable fields omitted from the request body are set to NULL.
  /// The ID of the object to update is specified in the request body.
  ///
  Future<Account> updateAccount({
    required Account account,
    String? realmId,
    String? authToken,
  }) async {

    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',

    };

    Map<String, String> params = {
      "minorversion": minorVersion.toString()
    };

    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/account", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(account.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Account.fromJson(jsonDecode(response.body)["Account"]);
    }
    else {
      throw AccountException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class AccountException implements Exception {
  final String? message;
  final int statusCode;

  AccountException({required this.statusCode, this.message});

  @override
  String toString() {
    return "AccountException: $statusCode - $message";
  }
}

