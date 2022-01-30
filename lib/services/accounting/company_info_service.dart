import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL:https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/companyinfo
class CompanyInfoService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  CompanyInfoService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  Future<List<CompanyInfo>> queryCompanyInfo({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).companyInfo!;
    }
    else {
      throw CompanyInfoException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<CompanyInfo> readCompanyInfo({
    required String companyId,
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
        baseUrl, "/v3/company/$realmId/companyinfo/$companyId", params);

    print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return CompanyInfo.fromJson(jsonDecode(response.body)["CompanyInfo"]);
    }
    else {
      throw CompanyInfoException(statusCode: response.statusCode, message: response.body);
    }
  }


  ///
  /// Sparse updating provides the ability to update a
  /// subset of properties for a given object; only elements
  /// specified in the request are updated. Missing elements are
  /// left untouched. The ID of the object to update is specified in
  /// the request body.​ Available with minor version 11
  ///
  Future<CompanyInfo> updateCompanyInfo({
    required CompanyInfo companyInfo,
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
        baseUrl, "/v3/company/$realmId/companyinfo", params);

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(companyInfo.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return CompanyInfo.fromJson(jsonDecode(response.body)["CompanyInfo"]);
    }
    else {
      throw CompanyInfoException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class CompanyInfoException implements Exception {
  final String? message;
  final int statusCode;

  CompanyInfoException({required this.statusCode, this.message});

  @override
  String toString() {
    return "CompanyInfoException: $statusCode - $message";
  }
}

