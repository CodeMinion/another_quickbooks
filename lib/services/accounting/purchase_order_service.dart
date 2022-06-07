import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/all-entities/purchaseorder
// The PurchaseOrder object is a non-posting transaction representing
// a request to purchase goods or services from a third party.
///
class PurchaseOrderService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  PurchaseOrderService(
      {required this.baseUrl,
      required this.authenticationService,
      this.minorVersion = 63});

  ///
  /// Returns the results of the query.
  ///
  Future<List<PurchaseOrder>> queryPurchaseOrder({
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

    Uri endpoint = Uri.https(baseUrl, "/v3/company/$realmId/query", params);

    //print (endpoint.toString());

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"])
          .purchaseOrder!;
    } else {
      throw PurchaseOrderException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of a purchaseOrder that has been previously created.
  ///
  Future<PurchaseOrder> readPurchaseOrder({
    required String purchaseOrderId,
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

    Map<String, String> params = {"minorversion": minorVersion.toString()};

    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/purchaseorder/$purchaseOrderId", params);

    //print (endpoint.toString());

    var response = await http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return PurchaseOrder.fromJson(jsonDecode(response.body)["PurchaseOrder"]);
    } else {
      throw PurchaseOrderException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// The minimum elements to create an purchaseOrder are listed here.
  ///
  Future<PurchaseOrder> createPurchaseOrder({
    required PurchaseOrder purchaseOrder,
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

    Map<String, String> params = {"minorversion": minorVersion.toString()};

    Uri endpoint =
        Uri.https(baseUrl, "/v3/company/$realmId/purchaseorder", params);

    //print (endpoint.toString());

    var response = await http.post(endpoint,
        body: jsonEncode(purchaseOrder.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return PurchaseOrder.fromJson(jsonDecode(response.body)["PurchaseOrder"]);
    } else {
      throw PurchaseOrderException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Use this operation to update any of the writable fields of
  /// an existing purchaseOrder object. The request body must include all
  /// writable fields of the existing object as returned in a read
  /// response. Writable fields omitted from the request body are set
  /// to NULL. The ID of the object to update is specified in the request body.
  ///
  Future<PurchaseOrder> updatePurchaseOrder({
    required PurchaseOrder purchaseOrder,
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

    Map<String, String> params = {"minorversion": minorVersion.toString()};

    Uri endpoint =
        Uri.https(baseUrl, "/v3/company/$realmId/purchaseorder", params);

    //print (endpoint.toString());

    var response = await http.post(endpoint,
        body: jsonEncode(purchaseOrder.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return PurchaseOrder.fromJson(jsonDecode(response.body)["PurchaseOrder"]);
    } else {
      throw PurchaseOrderException(
          statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// This operation deletes the purchaseOrder object specified in the request body.
  /// Include a minimum of PurchaseOrder.Id and PurchaseOrder.SyncToken in the request body.
  /// You must unlink any linked transactions associated with the purchaseOrder
  /// object before deleting it.
  ///
  Future<DeleteResponse> deletePurchaseOrder({
    required PurchaseOrder purchaseOrder,
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

    Uri endpoint =
        Uri.https(baseUrl, "/v3/company/$realmId/purchaseorder", params);

    //print (endpoint.toString());

    var response = await http.post(endpoint,
        body: jsonEncode(purchaseOrder.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return DeleteResponse.fromJson(
          jsonDecode(response.body)["PurchaseOrder"]);
    } else {
      throw PurchaseOrderException(
          statusCode: response.statusCode, message: response.body);
    }
  }
}

class PurchaseOrderException implements Exception {
  final String? message;
  final int statusCode;

  PurchaseOrderException({required this.statusCode, this.message});

  @override
  String toString() {
    return "PurchaseOrderException: $statusCode - $message";
  }
}
