
// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/bankaccounts
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
///
class BillService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  BillService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  Future<List<Bill>> queryBill({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).bill!;
    }
    else {
      throw BillException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Bill> readBill({
    required String billId,
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
        baseUrl, "/v3/company/$realmId/bill/$billId", params);

    print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Bill.fromJson(jsonDecode(response.body)["Bill"]);
    }
    else {
      throw BillException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Bill> createBill({
    required ReferenceType vendorRef,
    required List<Line> line,
    CurrencyRefType? currencyRef,

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

    var body = Bill(vendorRef: vendorRef, line: line, currencyRef: currencyRef );

    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/bill", params);

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(body.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Bill.fromJson(jsonDecode(response.body)["Account"]);
    }
    else {
      throw BillException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Use this operation to update any of the writable fields of
  /// an existing bill object. The request body must include all
  /// writable fields of the existing object as returned in a read
  /// response. Writable fields omitted from the request body are set
  /// to NULL. The ID of the object to update is specified in the request body.
  ///
  Future<Bill> updateBill({
    required Bill bill,
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
        baseUrl, "/v3/company/$realmId/bill", params);

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(bill.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Bill.fromJson(jsonDecode(response.body)["Bill"]);
    }
    else {
      throw BillException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<DeleteResponse> deleteBill({
    required Bill bill,
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
      "minorversion": minorVersion.toString(),
      "operation": "delete"
    };

    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/bill", params);

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(bill.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return DeleteResponse.fromJson(jsonDecode(response.body)["Bill"]);
    }
    else {
      throw BillException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class BillException implements Exception {
  final String? message;
  final int statusCode;

  BillException({required this.statusCode, this.message});

  @override
  String toString() {
    return "BillException: $statusCode - $message";
  }
}

