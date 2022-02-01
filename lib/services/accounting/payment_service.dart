
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/payment
/// A Payment object records a payment in QuickBooks.
/// The payment can be applied for a particular customer
/// against multiple Invoices and Credit Memos. It can also
/// be created without any Invoice or Credit Memo, by just
/// specifying an amount.
///
class PaymentService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  PaymentService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the results of the query.
  ///
  Future<List<Payment>> queryPayment({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).payment!;
    }
    else {
      throw PaymentException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of a Payment object that has been
  /// previously created.
  ///
  Future<Payment> readPayment({
    required String paymentId,
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
        baseUrl, "/v3/company/$realmId/payment/$paymentId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Payment.fromJson(jsonDecode(response.body)["Payment"]);
    }
    else {
      throw PaymentException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Creates a payment
  ///
  Future<Payment> createPayment({
    required Payment payment,
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
        baseUrl, "/v3/company/$realmId/payment", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(payment.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Payment.fromJson(jsonDecode(response.body)["Payment"]);
    }
    else {
      throw PaymentException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Use this operation to update any of the writable fields
  /// of an existing Payment object. The request body must
  /// include all writable fields of the existing object as
  /// returned in a read response. Writable fields omitted
  /// from the request body are set to NULL. The ID of the
  /// object to update is specified in the request body.
  ///
  Future<Payment> updatePayment({
    required Payment payment,
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
        baseUrl, "/v3/company/$realmId/payment", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(payment.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Payment.fromJson(jsonDecode(response.body)["Payment"]);
    }
    else {
      throw PaymentException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// This operation deletes the Payment object specified in the request body.
  /// Include a minimum of Payment.Id and Payment.SyncToken in the request body.
  ///
  Future<DeleteResponse> deletePayment({
    required Payment payment,
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
        baseUrl, "/v3/company/$realmId/payment", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(payment.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return DeleteResponse.fromJson(jsonDecode(response.body)["Payment"]);
    }
    else {
      throw PaymentException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Use a sparse update operation with include=void to void an
  /// existing Payment object; include a minimum of Payment.Id
  /// and Payment.SyncToken.The transaction remains active but
  /// all amounts and quantities are zeroed and the string, Voided,
  /// is injected into Payment.PrivateNote, prepended to existing text
  /// if present. If funds for the payment have been deposited,
  /// you must delete the associated deposit object before voiding
  /// the payment object.
  ///
  Future<Payment> voidPayment({
    required Payment payment,
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
        baseUrl, "/v3/company/$realmId/payment", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(payment.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Payment.fromJson(jsonDecode(response.body)["Payment"]);
    }
    else {
      throw PaymentException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// This resource returns the specified object in the
  /// response body as an Adobe Portable Document Format (PDF) file.
  /// The resulting PDF file is formatted according to custom form
  /// styles in the company settings.
  ///
  Future<Uint8List> getPaymentPdf({
    required String paymentId,
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
        baseUrl, "/v3/company/$realmId/payment/$paymentId/pdf", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    else {
      throw PaymentException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Sends a payment to the specified email.
  ///
  Future<Payment> sendPayment({
    required String paymentId,
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
        baseUrl, "/v3/company/$realmId/payment/$paymentId/send", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Payment.fromJson(jsonDecode(response.body)["Payment"]);
    }
    else {
      throw PaymentException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class PaymentException implements Exception {
  final String? message;
  final int statusCode;

  PaymentException({required this.statusCode, this.message});

  @override
  String toString() {
    return "PaymentException: $statusCode - $message";
  }
}

