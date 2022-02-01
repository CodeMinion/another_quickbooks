
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/profitandloss
/// The information below provides a reference on how to access
/// the Profit and Loss Summary report from the
/// QuickBooks Online Report Service.
///
class ProfitAndLossService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  ProfitAndLossService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the report for the query
  ///
  Future<ProfitAndLoss> queryReport({
    required ProfitAndLossQuery query,
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
    }..addAll(query.toJson().map((key, value) => MapEntry(key, value.toString())));


    Uri endpoint = Uri.https(
        baseUrl, "/v3/company/$realmId/reports/ProfitAndLoss", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return ProfitAndLoss.fromJson(jsonDecode(response.body));
    }
    else {
      throw ProfitAndLossException(statusCode: response.statusCode, message: response.body);
    }
  }

}

class ProfitAndLossException implements Exception {
  final String? message;
  final int statusCode;

  ProfitAndLossException({required this.statusCode, this.message});

  @override
  String toString() {
    return "ProfitAndLossException: $statusCode - $message";
  }
}

