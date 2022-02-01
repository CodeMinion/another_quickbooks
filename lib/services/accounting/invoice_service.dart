
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/invoice
///
class InvoiceService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  InvoiceService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  Future<List<Invoice>> queryInvoice({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).invoice!;
    }
    else {
      throw InvoiceException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Invoice> readInvoice({
    required String invoiceId,
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
        baseUrl, "/v3/company/$realmId/invoice/$invoiceId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Invoice.fromJson(jsonDecode(response.body)["Invoice"]);
    }
    else {
      throw InvoiceException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Invoice> createInvoice({
    required Invoice invoice,
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
        baseUrl, "/v3/company/$realmId/invoice", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(invoice.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Invoice.fromJson(jsonDecode(response.body)["Invoice"]);
    }
    else {
      throw InvoiceException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Use this operation to update any of the writable fields of an
  /// existing estimate object. The request body must include
  /// all writable fields of the existing object as returned in a
  /// read response. Writable fields omitted from the request body
  /// are set to NULL. The ID of the object to update is specified
  /// in the request body.
  ///
  Future<Invoice> updateInvoice({
    required Invoice invoice,
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
        baseUrl, "/v3/company/$realmId/invoice", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(invoice.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Invoice.fromJson(jsonDecode(response.body)["Invoice"]);
    }
    else {
      throw InvoiceException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<DeleteResponse> deleteInvoice({
    required Invoice invoice,
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
        baseUrl, "/v3/company/$realmId/invoice", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(invoice.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return DeleteResponse.fromJson(jsonDecode(response.body)["Invoice"]);
    }
    else {
      throw InvoiceException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Invoice> voidInvoice({
    required Invoice invoice,
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
      "operation": "void"
    };

    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/invoice", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(invoice.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Invoice.fromJson(jsonDecode(response.body)["Invoice"]);
    }
    else {
      throw InvoiceException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Uint8List> getInvoicePdf({
    required String invoiceId,
    String? realmId,
    String? authToken,
  }) async {

    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json; charset=UTF-8',
      //'Accept': 'application/json',

    };

    Map<String, String> params = {
      "minorversion": minorVersion.toString()
    };


    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/invoice/$invoiceId/pdf", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    else {
      throw InvoiceException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Invoice> sendInvoice({
    required String invoiceId,
    required String emailTo,
    String? realmId,
    String? authToken,
  }) async {

    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/octet-stream',
      'Accept': 'application/json',

    };

    Map<String, String> params = {
      "minorversion": minorVersion.toString(),
      "sendTo": emailTo
    };

    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/invoice/$invoiceId/send", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Invoice.fromJson(jsonDecode(response.body)["Invoice"]);
    }
    else {
      throw InvoiceException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class InvoiceException implements Exception {
  final String? message;
  final int statusCode;

  InvoiceException({required this.statusCode, this.message});

  @override
  String toString() {
    return "EstimateException: $statusCode - $message";
  }
}

