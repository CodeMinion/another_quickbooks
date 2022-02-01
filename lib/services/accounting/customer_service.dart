
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';

///
/// URL: https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/customer
/// A customer is a consumer of the service or product that your business offers.
/// An individual customer can have an underlying nested structure,
/// with a parent customer (the top-level object) having zero or more
/// sub-customers and jobs associated with it.
/// Sub-customer examples:
/// Members of a team or league: the team itself is the parent customer
/// and the members are sub-customers.
/// Properties managed by a property management company: the management
/// company is the parent customer and the properties are the sub-customers.
/// Job examples:
/// Tracking a kitchen remodel: the home owner is the parent customer
/// and individual kitchen remodel tasks are jobs.
/// Tracking car repairs: the car owner is the parent customer
/// and individual car repairs are jobs.
/// Use the Customer resource to create parent customer objects,
/// sub-customer objects, and job objects according to your business
/// requirements. Use the ParentRef and Job attributes in the customer
/// object to designate whether the object is a parent, nested job or
/// nested sub-customer.
/// First, create parent customer objects: Set Job to false
/// (default) and do not define ParentRef.
/// Then, create sub-customer and job objects: Set Job to true
/// and set ParentRef to reference parent customer object.
/// Going forward, specify an individual parent customer object,
/// sub-customer object, or job object in sales transactions
/// via the transaction's CustomerRef attribute, based on your
/// business requirements.See QuickBooks product documentation
/// for more about sub-customers and jobs.
///
class CustomerService {
  final String baseUrl;
  final AuthenticationService authenticationService;
  final int minorVersion;

  CustomerService(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63});


  ///
  /// Returns the results of the query.
  ///
  Future<List<Customer>> queryCustomer({
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
      return QueryResponse.fromJson(jsonDecode(response.body)["QueryResponse"]).customer!;
    }
    else {
      throw CustomerException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Retrieves the details of a Customer object that has
  /// been previously created.
  ///
  Future<Customer> readCustomer({
    required String customerId,
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
        baseUrl, "/v3/company/$realmId/customer/$customerId", params);

    //print (endpoint.toString());

    var response = await
    http.get(endpoint, headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Customer.fromJson(jsonDecode(response.body)["Customer"]);
    }
    else {
      throw CustomerException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// The DisplayName attribute or at least one of Title, GivenName,
  /// MiddleName, FamilyName, or Suffix attributes is required during
  /// object create.
  ///
  Future<Customer> createCustomer({
    required Customer customer,
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
        baseUrl, "/v3/company/$realmId/customer", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(customer.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Customer.fromJson(jsonDecode(response.body)["Customer"]);
    }
    else {
      throw CustomerException(statusCode: response.statusCode, message: response.body);
    }
  }

  ///
  /// Sparse updating provides the ability to update a subset
  /// of properties for a given object; only elements specified
  /// in the request are updated. Missing elements are left untouched.
  /// The ID of the object to update is specified in the request body.​
  ///
  Future<Customer> updateCustomer({
    required Customer customer,
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
        baseUrl, "/v3/company/$realmId/customer", params);

    //print (endpoint.toString());

    var response = await
    http.post(endpoint, body: jsonEncode(customer.toJson()), headers: headers);

    if (response.statusCode == 200) {
      //print (jsonDecode(response.body));
      return Customer.fromJson(jsonDecode(response.body)["Customer"]);
    }
    else {
      throw CustomerException(statusCode: response.statusCode, message: response.body);
    }
  }
}

class CustomerException implements Exception {
  final String? message;
  final int statusCode;

  CustomerException({required this.statusCode, this.message});

  @override
  String toString() {
    return "CustomerException: $statusCode - $message";
  }
}

