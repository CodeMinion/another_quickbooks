
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/employee
class EmployeeService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  EmployeeService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  Future<List<Employee>> queryEmployee({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).employee!;
    }
    else {
      throw EmployeeException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Employee> readEmployee({
    required String employeeId,
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
        baseUrl, "/v3/company/$realmId/employee/$employeeId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Employee.fromJson(jsonDecode(response.body)["Employee"]);
    }
    else {
      throw EmployeeException(statusCode: response.statusCode, message: response.body);
    }
  }

  Future<Employee> createEmployee({
    required Employee employee,
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
        baseUrl, "/v3/company/$realmId/employee", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(employee.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Employee.fromJson(jsonDecode(response.body)["Employee"]);
    }
    else {
      throw EmployeeException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Use this operation to update any of the writable fields of an
  /// existing employee object. The request body must include all
  /// writable fields of the existing object as returned in a read
  /// response. Writable fields omitted from the request body are set
  /// to NULL. The ID of the object to update is specified in the request body.
  ///
  Future<Employee> updateEmployee({
    required Employee employee,
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
        baseUrl, "/v3/company/$realmId/employee", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(employee.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Employee.fromJson(jsonDecode(response.body)["Employee"]);
    }
    else {
      throw EmployeeException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class EmployeeException implements Exception {
  final String? message;
  final int statusCode;

  EmployeeException({required this.statusCode, this.message});

  @override
  String toString() {
    return "EmployeeException: $statusCode - $message";
  }
}

