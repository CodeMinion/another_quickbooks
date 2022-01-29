library another_quickbooks;

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:another_quickbooks/services/authentication_service.dart';
import 'package:another_quickbooks/services/discovery_service.dart';

/// A Calculator.
class QuickbooksClient {

  //ABNIuyQM0oAR68j9E4qFlXa1wECY4TDah7H7w3urknpWDlgYKA
  final EnvironmentType environmentType;
  final String applicationId;
  final String clientId;
  final String clientSecret;
  String _url = "quickbooks.api.intuit.com";
  String _discoveryUrl = "https://developer.api.intuit.com/.well-known/openid_sandbox_configuration";
  late DiscoveryService _discoveryService;
  AuthenticationService? _authenticationService;

  QuickbooksClient({
    required this.applicationId,
    required this.clientId,
    required this.clientSecret,
    this.environmentType = EnvironmentType.Sandbox

  }) {

      if(environmentType == EnvironmentType.Sandbox) {
        _url = "sandbox-quickbooks.api.intuit.com";
        _discoveryUrl = "https://developer.api.intuit.com/.well-known/openid_sandbox_configuration";
      }
      else {
        _url = "quickbooks.api.intuit.com";
        _discoveryUrl = "https://developer.api.intuit.com/.well-known/openid_configuration";
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
      revocationEndpoint: discovery.revocation_endpoint
    );
  }

  ///
  /// Returns an Authorization URL for presenting the user with
  /// a modal authorization.
  ///
  String getAuthorizationPageUrl({
    required List<Scope> scopes, required String redirectUrl, required String state}) {
    if (_authenticationService == null) {
      throw ClientNotInitializedException(message: "Auth Not Ready");
    }
    else {
      return _authenticationService!.getAuthorizationPageUrl(
          scopes: scopes, redirectUrl: redirectUrl, state: state);
    }

  }

  ///
  /// Gets the Authorization Token from the code.
  ///
  Future<TokenResponse> getAuthToken({required String code, required String redirectUrl }) async {
    if (_authenticationService == null) {
      throw ClientNotInitializedException(message: "Auth Not Ready");
    }
    else {
      return _authenticationService!.getAuthToken(code: code, redirectUrl: redirectUrl);
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
    }
    else {
      return _authenticationService!.refreshToken(refreshToken: refreshToken);
    }
  }

  bool isInitialized() {
    // TODO Use variable
    return true;
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
