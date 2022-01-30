
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/customer
///
class CustomerService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  CustomerService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  Future<List<Customer>> queryCustomer({
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

    print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).customer!;
    }
    else {
      throw CustomerException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Customer> readCustomer({
    required String customerId,
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
        baseUrl, "/v3/company/$realmId/customer/$customerId", params);

    print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Customer.fromJson(jsonDecode(response.body)["Customer"]);
    }
    else {
      throw CustomerException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Customer> createCustomer({
    required Customer customer,
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
        baseUrl, "/v3/company/$realmId/customer", params);

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(customer.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Customer.fromJson(jsonDecode(response.body)["Customer"]);
    }
    else {
      throw CustomerException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Sparse updating provides the ability to update a subset
  /// of properties for a given object; only elements specified
  /// in the request are updated. Missing elements are left untouched.
  /// The ID of the object to update is specified in the request body.​
  ///
  Future<Customer> updateCustomer({
    required Customer customer,
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
        baseUrl, "/v3/company/$realmId/customer", params);

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(customer.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Customer.fromJson(jsonDecode(response.body)["Customer"]);
    }
    else {
      throw CustomerException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class CustomerException implements Exception {
  final String? message;
  final int statusCode;

  CustomerException({required this.statusCode, this.message});

  @override
  String toString() {
    return "CustomerException: $statusCode - $message";
  }
}

