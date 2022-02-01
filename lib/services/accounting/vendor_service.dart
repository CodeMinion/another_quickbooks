
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/vendor
/// The Vendor object represents the seller from whom your
/// company purchases any service or product.
///
class VendorService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  VendorService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the results of the query.
  ///
  Future<List<Vendor>> queryVendor({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).vendor!;
    }
    else {
      throw VendorException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of a Vendor object that has been previously created.
  ///
  Future<Vendor> readVendor({
    required String vendorId,
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
        baseUrl, "/v3/company/$realmId/vendor/$vendorId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Vendor.fromJson(jsonDecode(response.body)["Vendor"]);
    }
    else {
      throw VendorException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Either the DisplayName attribute or at least one of Title, GivenName,
  /// MiddleName, FamilyName, or Suffix attributes are required during create.
  ///
  Future<Vendor> createVendor({
    required Vendor vendor,
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
        baseUrl, "/v3/company/$realmId/vendor", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(vendor.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Vendor.fromJson(jsonDecode(response.body)["Vendor"]);
    }
    else {
      throw VendorException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Use this operation to update any of the writable
  /// fields of an existing vendor object. The request
  /// body must include all writable fields of the existing
  /// object as returned in a read response. Writable fields
  /// omitted from the request body are set to NULL. The ID of
  /// the object to update is specified in the request body.Add
  /// the query parameter, include=updateaccountontxns&minorversion=5,
  /// to the endpoint to automatically update the AP account on historical
  /// transactions (from soft close date forward) for this vendor with that
  /// defined by the APAccountRef attribute in the Vendor object. Updates
  /// on soft closed transacitons associated will fail.
  ///
  Future<Vendor> updateVendor({
    required Vendor vendor,
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
        baseUrl, "/v3/company/$realmId/vendor", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(vendor.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Vendor.fromJson(jsonDecode(response.body)["Vendor"]);
    }
    else {
      throw VendorException(statusCode: response.statusCode, message: response.body);
    }
  }

}

class VendorException implements Exception {
  final String? message;
  final int statusCode;

  VendorException({required this.statusCode, this.message});

  @override
  String toString() {
    return "VendorException: $statusCode - $message";
  }
}

