
import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:another_quickbooks/another_quickbooks.dart';

void main() {

  final String applicationId = "b790c7c7-28bb-4614-898d-d4587";
  final String clientId = "ABNIuyQM0oAR68j9E4qFlXa1wECY4TDah7H7w3urknpWDlgYKA";
  final String clientSecret = "iZU1Dyqh2TNz0Rp01z83SJ4n6XggN2nTGZNHU3AC";
  final String refreshToken = "AB11652296788mUqtDdp2TUwNA5qS7VNGMoYqvw9vbNTxDZIel";//"AB11652210098Wbv587q2tebOcKFcsPRplbRtoqobsvEmI2vVr";
  final String realmId = "4620816365213534410";


  test('test bank account create ', () async {
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

    var accountCreated = await quickClient.getPaymentClient().createBankAccount(
        realmId: realmId,
        requestId: "123456",
        customerId: "2",
        account: BankAccount.fromJson({
          "phone": "6047296480",
          "routingNumber": "021000021",
          "name": "My Checking",
          "accountType": "PERSONAL_CHECKING",
          "accountNumber": "12334534"
        }));

    print(accountCreated);
    expect(accountCreated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test bank account create from token', () async {
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

    var accountCreated = await quickClient.getPaymentClient().createBankAccountFromToken(
        realmId: realmId,
        requestId: "123456",
        customerId: "2",
        accountToken: "F+hgXXynTwwTi3B70MFysfj/s7o=");

    print(accountCreated);
    expect(accountCreated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read bank accounts ', () async {
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

    var response = await quickClient.getPaymentClient().readAllBankAccounts(
        realmId: realmId,
        requestId: "5555",
        customerId: "2"
      );

    print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read bank account ', () async {
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

    var response = await quickClient.getPaymentClient().readBankAccount(
        realmId: realmId,
        bankAccountId: "200175477707004247954534",
        customerId: "2"
    );

    print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test delete bank account ', () async {
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

    var response = await quickClient.getPaymentClient().deleteBankAccount(
        realmId: realmId,
        requestId: "1234",
        bankAccountId: "200175477707004247954534",
        customerId: "2"
    );

    print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });
}