
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/invoice
/// An Invoice represents a sales form where the customer
/// pays for a product or service later.
///
class InvoiceService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  InvoiceService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the results of the query.
  ///
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

  ///
  /// Retrieves the details of an invoice that has been previously created.
  ///
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

  ///
  /// Have at least one Line a sales item or inline subtotal.
  /// Have a populated CustomerRef element.
  ///
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

  ///
  /// This operation deletes the invoice object specified in the request body.
  /// Include a minimum of Invoice.Id and Invoice.SyncToken in the
  /// request body. You must unlink any linked transactions associated
  /// with the invoice object before deleting it.
  ///
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

  ///
  /// Use this operation to void an existing invoice object;
  /// include a minimum of Invoice.Id and the current Invoice.SyncToken.
  /// The transaction remains active but all amounts and quantities
  /// are zeroed and the string, Voided, is injected into Invoice.PrivateNote,
  /// prepended to existing text if present.
  ///
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

  ///
  /// This resource returns the specified object in the
  /// response body as an Adobe Portable Document Format (PDF) file.
  /// The resulting PDF file is formatted according to custom form styles
  /// in the company settings.
  ///
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

  ///
  /// The Invoice.EmailStatus parameter is set to EmailSent.
  /// The Invoice.DeliveryInfo element is populated with sending
  /// information<./li>
  /// The Invoice.BillEmail.Address parameter is updated to the address
  /// specified with the value of the sendTo query parameter, if specified.
  ///
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

