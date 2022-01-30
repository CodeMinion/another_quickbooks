library another_quickbooks;

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/accounting/account_service.dart';
import 'package:another_quickbooks/services/accounting/bill_service.dart';
import 'package:another_quickbooks/services/accounting/company_info_service.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:another_quickbooks/services/discovery_service.dart';
import 'package:another_quickbooks/services/payments/bank_accounts_service.dart';

/// A Calculator.
class QuickbooksClient {
  //ABNIuyQM0oAR68j9E4qFlXa1wECY4TDah7H7w3urknpWDlgYKA
  final EnvironmentType environmentType;
  final String applicationId;
  final String clientId;
  final String clientSecret;
  String _url = "quickbooks.api.intuit.com";
  String _discoveryUrl =
      "https://developer.api.intuit.com/.well-known/openid_sandbox_configuration";
  late DiscoveryService _discoveryService;
  AuthenticationService? _authenticationService;
  PaymentClient? _paymentClient;
  AccountingClient? _accountingClient;

  QuickbooksClient(
      {required this.applicationId,
      required this.clientId,
      required this.clientSecret,
      this.environmentType = EnvironmentType.Sandbox}) {
    if (environmentType == EnvironmentType.Sandbox) {
      _url = "sandbox-quickbooks.api.intuit.com";
      _discoveryUrl =
          "https://developer.api.intuit.com/.well-known/openid_sandbox_configuration";
    } else {
      _url = "quickbooks.api.intuit.com";
      _discoveryUrl =
          "https://developer.api.intuit.com/.well-known/openid_configuration";
    }
    _discoveryService = DiscoveryService(discoveryUrl: _discoveryUrl);
  }

  /// Initializes the client by fetching the
  /// URLs from the discovery urls
  Future<void> initialize() async {
    // Discover Urls from Quickbooks
    UrlDiscovery discovery = await _discoveryService.initialize();
    // TODO Initialize Services
    _authenticationService = AuthenticationService(
        clientId: clientId,
        clientSecret: clientSecret,
        authorizationEndpoint: discovery.authorization_endpoint,
        tokenEndpoint: discovery.token_endpoint,
        revocationEndpoint: discovery.revocation_endpoint);
    _paymentClient = PaymentClient._(
        baseUrl: _url, authenticationService: _authenticationService!);

    _accountingClient = AccountingClient._(
        baseUrl: _url, authenticationService: _authenticationService!);
  }

  ///
  /// Returns an Authorization URL for presenting the user with
  /// a modal authorization.
  ///
  String getAuthorizationPageUrl(
      {required List<Scope> scopes,
      required String redirectUrl,
      required String state}) {
    if (_authenticationService == null) {
      throw ClientNotInitializedException(message: "Auth Not Ready");
    } else {
      return _authenticationService!.getAuthorizationPageUrl(
          scopes: scopes, redirectUrl: redirectUrl, state: state);
    }
  }

  ///
  /// Gets the Authorization Token from the code.
  ///
  Future<TokenResponse> getAuthToken(
      {required String code,
      required String redirectUrl,
      required String realmId}) async {
    if (_authenticationService == null) {
      throw ClientNotInitializedException(message: "Auth Not Ready");
    } else {
      return _authenticationService!
          .getAuthToken(code: code, redirectUrl: redirectUrl, realmId: realmId);
    }
  }

  ///
  /// Refreshes the authorization token.
  /// Note: If refreshToken is not set it will attempt to use the refresh
  /// token from the last token request it cached if any.
  ///
  Future<TokenResponse> refreshToken({String refreshToken = ""}) async {
    if (_authenticationService == null) {
      throw ClientNotInitializedException(message: "Auth Not Ready");
    } else {
      return _authenticationService!.refreshToken(refreshToken: refreshToken);
    }
  }

  ///
  /// Returns the payment client.
  ///
  PaymentClient getPaymentClient() {
    if (_paymentClient == null) {
      throw ClientNotInitializedException(message: "Payment Not Ready");
    } else {
      return _paymentClient!;
    }
  }

  ///
  /// Returns the accounting client.
  ///
  AccountingClient getAccountingClient() {
    if (_accountingClient == null) {
      throw ClientNotInitializedException(message: "Accounting Not Ready");
    } else {
      return _accountingClient!;
    }
  }

  bool isInitialized() {
    return _authenticationService != null;
  }
}

///
/// The payment client exposes all the Quickbook Payments API
/// Note: This requires a token with the Payments scope.
///
class PaymentClient {
  final String baseUrl;
  late BankAccountsService _accountsService;
  final AuthenticationService authenticationService;

  PaymentClient._(
      {required this.baseUrl, required this.authenticationService}) {
    _accountsService = BankAccountsService(
        baseUrl: baseUrl, authenticationService: authenticationService);
  }

  // TODO Expose Quickbook Payments APIs
  ///
  /// URL: https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/bankaccounts
  /// Creates a bank account
  Future<BankAccount> createAccount({
    required String requestId,
    required String customerId,
    required String name,
    required String accountNumber,
    required String phone,
    required BankAccountTypeEnum accountType,
    required String routingNumber,
    bool? isDefault,
    String? country,
    String? bankCode,
    String? inputType,
    String? realmId,
    String? authToken,
  }) async {
    return _accountsService.createAccount(
        requestId: requestId,
        customerId: customerId,
        name: name,
        accountNumber: accountNumber,
        phone: phone,
        accountType: accountType,
        routingNumber: routingNumber,
      isDefault: isDefault,
      country: country,
      bankCode:bankCode,
      inputType: inputType,
      realmId: realmId,
      authToken: authToken,

    );
  }
}

///
/// The accounting client exposes all the Quickbook Accounting API
/// Note: This requires a token with the Accounting scope.
///
class AccountingClient {
  final String baseUrl;
  final int minorVersion;
  late AccountService _accountsService;
  final AuthenticationService authenticationService;
  late CompanyInfoService _companyInfoService;
  late BillService _billService;

  AccountingClient._(
      {required this.baseUrl, required this.authenticationService, this.minorVersion = 63}) {
    _accountsService = AccountService(
        baseUrl: baseUrl, authenticationService: authenticationService, minorVersion: minorVersion);

    _companyInfoService = CompanyInfoService(
        baseUrl: baseUrl, authenticationService: authenticationService, minorVersion: minorVersion);

    _billService = BillService(
        baseUrl: baseUrl, authenticationService: authenticationService, minorVersion: minorVersion);
  }

  // Start: Account Service
  Future<List<Account>> queryAccount({
    required String query,
    String? realmId,
    String? authToken,
  }) async {
      return _accountsService.queryAccount(query: query, realmId: realmId, authToken: authToken);
  }

  Future<Account> readAccount({
    required String accountId,
    String? realmId,
    String? authToken,
  }) async {
    return _accountsService.readAccount(accountId: accountId, realmId: realmId, authToken: authToken);
  }

  Future<Account> createAccount({
    required String name,
    String? acctNum,
    ReferenceType? taxCodeRef,
    String? accountType,
    String? accountSubType,

    String? realmId,
    String? authToken,
  }) async {
    return _accountsService.createAccount(name: name,
        acctNum: acctNum, taxCodeRef: taxCodeRef,
        accountSubType: accountSubType, accountType:
        accountType, authToken: authToken, realmId: realmId);
  }

  ///
  /// Use this operation to update any of the writable
  /// fields of an existing account object.
  /// The request body must include all writable fields
  /// of the existing object as returned in a read response.
  /// Writable fields omitted from the request body are set to NULL.
  /// The ID of the object to update is specified in the request body.
  ///
  Future<Account> updateAccount({
    required Account account,
    String? realmId,
    String? authToken,
  }) async {
    return _accountsService.updateAccount(account: account, realmId: realmId, authToken: authToken);
  }

  // Start CompanyInfo
  Future<List<CompanyInfo>> queryCompanyInfo({
    required String query,
    String? realmId,
    String? authToken,
  }) async {
    return _companyInfoService.queryCompanyInfo(query: query, realmId: realmId, authToken: authToken);
  }

  Future<CompanyInfo> readCompanyInfo({
    required String companyId,
    String? realmId,
    String? authToken,
  }) async {
    return _companyInfoService.readCompanyInfo(companyId: companyId,
        realmId: realmId, authToken: authToken);
  }

  ///
  /// Sparse updating provides the ability to update a
  /// subset of properties for a given object; only elements
  /// specified in the request are updated. Missing elements are
  /// left untouched. The ID of the object to update is specified in
  /// the request body.​ Available with minor version 11
  ///
  Future<CompanyInfo> updateCompanyInfo({
    required CompanyInfo companyInfo,
    String? realmId,
    String? authToken,
  }) async {
    return _companyInfoService.updateCompanyInfo(companyInfo: companyInfo,
        realmId: realmId, authToken: authToken);
  }

  // Start: Bill Service
  Future<List<Bill>> queryBill({
    required String query,
    String? realmId,
    String? authToken,
  }) async {
    return _billService.queryBill(query: query, realmId: realmId, authToken: authToken);
  }

  Future<Bill> readBill({
    required String billId,
    String? realmId,
    String? authToken,
  }) async {
    return _billService.readBill(billId: billId, realmId: realmId, authToken: authToken);
  }

  Future<Bill> createBill({
    required ReferenceType vendorRef,
    required List<Line> line,
    CurrencyRefType? currencyRef,

    String? realmId,
    String? authToken,
  }) async {
    return _billService.createBill(vendorRef: vendorRef,
        line: line, currencyRef: currencyRef,
        realmId: realmId, authToken: authToken);
  }

  ///
  /// Use this operation to update any of the writable fields of
  /// an existing bill object. The request body must include all
  /// writable fields of the existing object as returned in a read
  /// response. Writable fields omitted from the request body are set
  /// to NULL. The ID of the object to update is specified in the request body.
  ///
  Future<Bill> updateBill({
    required Bill bill,
    String? realmId,
    String? authToken,
  }) async {
    return _billService.updateBill(bill: bill, realmId: realmId, authToken: authToken);
  }

  Future<DeleteResponse> deleteBill({
    required Bill bill,
    String? realmId,
    String? authToken,
  }) async {
    return _billService.deleteBill(bill: bill, realmId: realmId, authToken: authToken);
  }

}
enum EnvironmentType {
  Sandbox,
  Production,
}

class ClientNotInitializedException implements Exception {
  final String message;

  ClientNotInitializedException({required this.message});
}
