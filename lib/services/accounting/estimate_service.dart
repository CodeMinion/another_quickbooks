
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/estimate
/// The Estimate represents a proposal for a financial transaction
/// from a business to a customer for goods or services proposed to
/// be sold, including proposed pricing.
///
class EstimateService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  EstimateService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the results of the query.
  ///
  Future<List<Estimate>> queryEstimate({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).estimate!;
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of an estimate that has been previously created.
  ///
  Future<Estimate> readEstimate({
    required String estimateId,
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
        baseUrl, "/v3/company/$realmId/estimate/$estimateId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Estimate.fromJson(jsonDecode(response.body)["Estimate"]);
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// An Estimate must have at least one line that describes an item.
  /// An Estimate must have a reference to a customer.
  /// If shipping address and billing address are not provided,
  /// the address from the referenced Customer object is used.
  ///
  Future<Estimate> createEstimate({
    required Estimate estimate,
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
        baseUrl, "/v3/company/$realmId/estimate", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(estimate.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Estimate.fromJson(jsonDecode(response.body)["Estimate"]);
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
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
  Future<Estimate> updateEstimate({
    required Estimate estimate,
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
        baseUrl, "/v3/company/$realmId/estimate", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(estimate.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Estimate.fromJson(jsonDecode(response.body)["Estimate"]);
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// This operation deletes the estimate object specified
  /// in the request body. Include a minimum of Estimate.Id
  /// and Estimate.SyncToken in the request body.
  ///
  Future<DeleteResponse> deleteEstimate({
    required Estimate estimate,
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
        baseUrl, "/v3/company/$realmId/estimate", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(estimate.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return DeleteResponse.fromJson(jsonDecode(response.body)["Estimate"]);
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// This resource returns the specified object in the response
  /// body as an Adobe Portable Document Format (PDF) file.
  /// The resulting PDF file is formatted according to custom
  /// form styles in the company settings.
  ///
  Future<Uint8List> getEstimatePdf({
    required String estimateId,
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
        baseUrl, "/v3/company/$realmId/estimate/$estimateId/pdf", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// The Estimate.EmailStatus parameter is set to EmailSent.
  /// The Estimate.DeliveryInfo element is populated with sending information.
  /// The Estimate.BillEmail.Address parameter is updated to the
  /// address specified with the value of the sendTo query parameter,
  /// if specified.
  ///
  Future<Estimate> sendEstimate({
    required String estimateId,
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
        baseUrl, "/v3/company/$realmId/estimate/$estimateId/send", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Estimate.fromJson(jsonDecode(response.body)["Estimate"]);
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class EstimateException implements Exception {
  final String? message;
  final int statusCode;

  EstimateException({required this.statusCode, this.message});

  @override
  String toString() {
    return "EstimateException: $statusCode - $message";
  }
}

