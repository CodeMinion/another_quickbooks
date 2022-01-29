import 'package:another_quickbooks/quickbook_models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:another_quickbooks/another_quickbooks.dart';

void main() {
  test('adds one to input values', () async {
    final quickClient = QuickbooksClient(
        applicationId: "b790c7c7-28bb-4614-898d-d4587",
        clientId: "ABNIuyQM0oAR68j9E4qFlXa1wECY4TDah7H7w3urknpWDlgYKA",
        clientSecret: "iZU1Dyqh2TNz0Rp01z83SJ4n6XggN2nTGZNHU3AC");
    await quickClient.initialize();

    /*
    String authUrl = quickClient.getAuthorizationPageUrl(
        scopes: [Scope.Payments],
        redirectUrl: "https://developer.intuit.com/v2/OAuth2Playground/RedirectUrl",
        state: "Hello World");

    print (authUrl);
    expect(authUrl.length, isNot(0));
    */

    /*
    String token = (await quickClient.getAuthToken(
        code: "AB116434839514H49sfTB0RGrDoNPqoGh19V4kJWUk1UPRD7DU",
        redirectUrl: "https://developer.intuit.com/v2/OAuth2Playground/RedirectUrl",
        )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));
    */

    String token = (await quickClient.refreshToken(
      refreshToken: "AB11652210098Wbv587q2tebOcKFcsPRplbRtoqobsvEmI2vVr"
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    expect(quickClient.isInitialized(), true);
  });
}
