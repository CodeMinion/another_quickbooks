import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/item
class ItemService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  ItemService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  Future<List<Item>> queryItem({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).item!;
    }
    else {
      throw ItemException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Item> readItem({
    required String itemId,
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
        baseUrl, "/v3/company/$realmId/item/$itemId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Item.fromJson(jsonDecode(response.body)["Item"]);
    }
    else {
      throw ItemException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Item> createItem({
    required Item item,
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
        baseUrl, "/v3/company/$realmId/item", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(item.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Item.fromJson(jsonDecode(response.body)["Item"]);
    }
    else {
      throw ItemException(statusCode: response.statusCode, message: response.body);
    }
  }


  ///
  /// Use this operation to update any of the writable fields of an
  /// existing category object. The ID of the object to update is
  /// specified in the request body.
  ///
  Future<Item> updateItem({
    required Item item,
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
        baseUrl, "/v3/company/$realmId/item", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(item.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Item.fromJson(jsonDecode(response.body)["Item"]);
    }
    else {
      throw ItemException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class ItemException implements Exception {
  final String? message;
  final int statusCode;

  ItemException({required this.statusCode, this.message});

  @override
  String toString() {
    return "ItemException: $statusCode - $message";
  }
}

