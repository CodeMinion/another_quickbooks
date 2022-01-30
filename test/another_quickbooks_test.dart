import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:another_quickbooks/another_quickbooks.dart';

void main() {

  final String applicationId = "b790c7c7-28bb-4614-898d-d4587";
  final String clientId = "ABNIuyQM0oAR68j9E4qFlXa1wECY4TDah7H7w3urknpWDlgYKA";
  final String clientSecret = "iZU1Dyqh2TNz0Rp01z83SJ4n6XggN2nTGZNHU3AC";
  final String refreshToken = "AB11652210098Wbv587q2tebOcKFcsPRplbRtoqobsvEmI2vVr";
  final String realmId = "4620816365213534410";

  test('adds one to input values', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
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
      refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    expect(quickClient.isInitialized(), true);
  });


  test('test account create ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    var accountCreated = await quickClient.getPaymentClient().createAccount(
      realmId: "4620816365213534410",
        requestId: "ABCD1",
        customerId: "0",
        name: "Hello World", accountNumber:
    "1234-444-44-4-4",
        phone: "333445555",
        accountType: BankAccountTypeEnum.PERSONAL_SAVINGS,
        routingNumber: "asssssssddd");

    print(accountCreated);
    expect(accountCreated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test query account ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    var accountsFound = await quickClient.getAccountingClient().queryAccount(
        realmId: realmId,
      query: "select * from Account where Metadata.CreateTime > '2014-12-31'"
    );

    print(accountsFound);
    expect(accountsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test query account ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    var accountsFound = await quickClient.getAccountingClient().queryAccount(
        realmId: realmId,
        query: "select * from Account where Metadata.CreateTime > '2014-12-31'"
    );

    print(accountsFound);
    expect(accountsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });


  test('test read account ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    var accountsFound = await quickClient.getAccountingClient().readAccount(
        realmId: realmId,
        accountId: "33"
    );

    print(accountsFound);
    expect(accountsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test create account ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    var accountsFound = await quickClient.getAccountingClient().createAccount(
        realmId: realmId,
        name: "Test Account",
      accountType: "Accounts Receivable"
    );

    print(accountsFound);
    expect(accountsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test update account ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    //92
    var accountsFound = await quickClient.getAccountingClient().updateAccount(
        realmId: realmId,
        account: Account(
        id: "92",
            name: "Test Account Updated",
      accountType: "Accounts Receivable",
          syncToken: "2"
        )
    );

    print(accountsFound);
    expect(accountsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test query companyInfo ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    var resultsFound = await quickClient.getAccountingClient().queryCompanyInfo(
        realmId: realmId,
        query: "select * from CompanyInfo where Metadata.CreateTime > '2014-12-31'"
    );

    print(resultsFound);
    expect(resultsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });
  
  test('test read companyInfo ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    var found = await quickClient.getAccountingClient().readCompanyInfo(
        realmId: realmId,
        companyId: "1",
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test update companyInfo ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    print(token);
    expect(token.length, isNot(0));

    //Id:1
    var updated = await quickClient.getAccountingClient().updateCompanyInfo(
        realmId: realmId,
        companyInfo: CompanyInfo(
            id: "1",
            companyName: "Sandbox Company_US_1 Up",
            syncToken: "12",
          companyAddr: PhysicalAddress.fromJson(
            {
              "City": "Mountain View",
              "Country": "US",
              "Line1": "2500 Garcia Ave",
              "PostalCode": "94043",
              "CountrySubDivisionCode": "CA",
              "Id": "1"
            }
          )
        )
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });
}
