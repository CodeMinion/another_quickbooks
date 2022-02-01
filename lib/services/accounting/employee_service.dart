
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/employee
/// An Employee object represents a person working for the company. If
/// you are looking to create a Contractor via API, refer how to create
/// a Vendor object, with Vendor1099 field set to true.
///
/// The DisplayName, Title, GivenName, MiddleName, FamilyName, Suffix,
/// and PrintOnCheckName attributes must not contain colon (:),
/// tab (\t), or newline (\n) characters.
///
/// The DisplayName attribute must be unique across all other customer,
/// employee, and vendor objects.
///
/// The GivenName and FamilyName attributes are required.
/// The PrimaryEmailAddress attribute must contain an at sign (@) and dot (.).
/// The full complement of read, create, delete via deactivation
/// (active=false), and update operations are available both with
/// and without QuickBooks Payroll enabled. However, when Payroll
/// is enabled, support for some attributes is limited:
/// Title—Not supported when QuickBooks Payroll is enabled.
/// Suffix—Not supported when QuickBooks Payroll is enabled.
/// DisplayName —It’s read only when QuickBooks Payroll is enabled and a
/// concatenation of GivenName MiddleName FamilyName.
/// PrintOnCheckName—Not supported when QuickBooks Payroll is enabled.
/// BillRate—Not supported when QuickBooks Payroll is enabled.
/// SSN—Masked SSNs, as is returned in a response, cannot be passed
/// in a request when QuickBooks Payroll is enabled. Code for this
/// field must be removed before submitting.
///
class EmployeeService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  EmployeeService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the results of the query.
  ///
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

  ///
  /// Retrieves the details of a Employee object that has
  /// been previously created.
  ///
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

  ///
  /// Create an employee
  ///
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

