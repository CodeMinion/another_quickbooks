
// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/bankaccounts
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
///
class EstimateService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  EstimateService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


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

    print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).estimate!;
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

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

    print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Estimate.fromJson(jsonDecode(response.body)["Estimate"]);
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

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

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(estimate.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
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

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(estimate.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Estimate.fromJson(jsonDecode(response.body)["Estimate"]);
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

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

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(estimate.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return DeleteResponse.fromJson(jsonDecode(response.body)["Estimate"]);
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

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

    print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    else {
      throw EstimateException(statusCode: response.statusCode, message: response.body);
    }
  }

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

    print (endpoint.toString());

    var response = await
    http.post(endpoint, headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
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

