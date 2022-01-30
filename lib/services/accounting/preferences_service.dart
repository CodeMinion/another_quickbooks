
// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/bankaccounts
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
///
class PreferencesService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  PreferencesService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  Future<List<Preferences>> queryPreferences({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).preferences!;
    }
    else {
      throw PreferencesException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Preferences> readPreferences({
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
        baseUrl, "/v3/company/$realmId/preferences", params);

    print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Preferences.fromJson(jsonDecode(response.body)["Preferences"]);
    }
    else {
      throw PreferencesException(statusCode: response.statusCode, message: response.body);
    }
  }



  ///
  /// Use this operation to update any of the writable preference fields.
  /// The request body must include all writable fields of the
  /// existing object as returned in a read response.
  /// Writable fields omitted from the request body are set to
  /// NULL or reverted to a default value. The ID of the object
  /// to update is specified in the request body.
  ///
  Future<Preferences> updatePreferences({
    required Preferences preferences,
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
        baseUrl, "/v3/company/$realmId/preferences", params);

    print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(preferences.toJson()), headers: headers);

    if (response.statusCode == 200) {
      print (jsonDecode(response.body));
      return Preferences.fromJson(jsonDecode(response.body)["Preferences"]);
    }
    else {
      throw PreferencesException(statusCode: response.statusCode, message: response.body);
    }
  }

}

class PreferencesException implements Exception {
  final String? message;
  final int statusCode;

  PreferencesException({required this.statusCode, this.message});

  @override
  String toString() {
    return "PreferencesException: $statusCode - $message";
  }
}

