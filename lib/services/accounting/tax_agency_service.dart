
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/taxagency
/// A TaxAgency object is associated with a tax rate and
/// identifies the agency to which that tax rate applies,
/// that is, the entity that collects those taxes.
///
class TaxAgencyService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  TaxAgencyService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the results of the query.
  ///
  Future<List<TaxAgency>> queryTaxAgency({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).taxAgency!;
    }
    else {
      throw TaxAgencyException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of a TaxAgency object that has
  /// been previously created.
  ///
  Future<TaxAgency> readTaxAgency({
    required String taxAgencyId,
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
        baseUrl, "/v3/company/$realmId/taxagency/$taxAgencyId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return TaxAgency.fromJson(jsonDecode(response.body)["TaxAgency"]);
    }
    else {
      throw TaxAgencyException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// A TaxAgency object must have a DisplayName attribute.
  ///
  Future<TaxAgency> createTaxAgency({
    required TaxAgency agency,
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
        baseUrl, "/v3/company/$realmId/taxagency", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(agency.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return TaxAgency.fromJson(jsonDecode(response.body)["TaxAgency"]);
    }
    else {
      throw TaxAgencyException(statusCode: response.statusCode, message: response.body);
    }
  }


}

class TaxAgencyException implements Exception {
  final String? message;
  final int statusCode;

  TaxAgencyException({required this.statusCode, this.message});

  @override
  String toString() {
    return "TaxAgencyException: $statusCode - $message";
  }
}

