import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:http/http.dart' as http;

///
/// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/cards
/// Store credit cards and debit cards for processing future payments.
/// Note that storing cards for swiped transactions is not currently
/// supported by the payments API.
/// Applicable for US and Canada only
///
class CardService {
  final String baseUrl;
  final AuthenticationService authenticationService;

  CardService(
      {required this.baseUrl, required this.authenticationService});

  ///
  /// This operation allows you to store a new card object. Note that
  /// this card is only accessible via the Payments API.
  /// It will not appear in QuickBooks Online.
  ///
  Future<Card> createCard({
    required String requestId,
    required String customerId,
    required Card card,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Request-ID": requestId,
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };

    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/customers/$customerId/cards");

    //print (endpoint.toString());

    var response = await
        http.post(endpoint, headers: headers, body: jsonEncode(card.toJson()));

    if (response.statusCode == 200 || response.statusCode == 201) {
        return Card.fromJson(jsonDecode(response.body));
    }
    else {
      throw CardException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// This operation allows you to store a new card object from a token.
  ///
  Future<Card> createCardFromToken({
    required String requestId,
    required String customerId,
    required String cardToken,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Request-ID": requestId,
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };


    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/customers/$customerId/cards/createFromToken");

    //print (endpoint.toString());
    var response = await
    http.post(endpoint, headers: headers, body: jsonEncode({"value": cardToken}));

    if (response.statusCode == 200) {
      return Card.fromJson(jsonDecode(response.body));
    }
    else {
      throw CardException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Returns a list of up to ten cards for the company specified
  /// with the id parameter. The cards are returned in descending
  /// order with most recent entry first. This operation cannot
  /// retrieve cards created via the QuickBooks Online interface.
  /// If more than 10 cards are needed, specify the number to be
  /// retrieved using ?count=[number] appended to the end of the query.
  /// For example, /cards?count=100 would retrieve 100 cards.
  ///
  Future<List<Card>> readAllCards({
    required String requestId,
    required String customerId,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Request-ID": requestId,
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };


    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/customers/$customerId/cards");

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers,);

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List).map((e) => Card.fromJson(e)).toList();
    }
    else {
      throw CardException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves a specified card object.
  /// This operation cannot retrieve cards created via the
  /// QuickBooks Online interface.
  ///
  Future<Card> readCard({
    required String cardId,
    required String customerId,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };

    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/customers/$customerId/cards/$cardId");

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers,);

    if (response.statusCode == 200) {
      return Card.fromJson(jsonDecode(response.body));
    }
    else {
      throw CardException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Deletes a specified card object.
  ///
  Future<bool> deleteCard({
    required String requestId,
    required String cardId,
    required String customerId,
    String? realmId,
    String? authToken,
  }) async {
    authToken ??= authenticationService.getCachedToken()?.access_token;
    realmId ??= authenticationService.getCachedRealmId();

    Map<String, String> headers = {
      "Request-ID": requestId,
      "Authorization": "Bearer ${authToken ?? ""}",
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
    };

    Uri endpoint = Uri.https(
        baseUrl, "/quickbooks/v4/customers/$customerId/cards/$cardId");

    //print (endpoint.toString());

    var response = await
    http.delete(endpoint, headers: headers,);

    if (response.statusCode == 204) {
      return true;
    }
    else {
      throw CardException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class CardException implements Exception {
  final String? message;
  final int statusCode;

  CardException({required this.statusCode, this.message});

  @override
  String toString() {
    return "BankAccountException: $statusCode - $message";
  }
}
