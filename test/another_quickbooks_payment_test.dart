
import 'package:another_quickbooks/quickbook_models.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:another_quickbooks/another_quickbooks.dart';

void main() {

  const String applicationId = "b790c7c7-28bb-4614-898d-d4587";
  const String clientId = "ABNIuyQM0oAR68j9E4qFlXa1wECY4TDah7H7w3urknpWDlgYKA";
  const String clientSecret = "iZU1Dyqh2TNz0Rp01z83SJ4n6XggN2nTGZNHU3AC";
  const String refreshToken = "AB11652296788mUqtDdp2TUwNA5qS7VNGMoYqvw9vbNTxDZIel";//"AB11652210098Wbv587q2tebOcKFcsPRplbRtoqobsvEmI2vVr";
  const String realmId = "4620816365213534410";


  test('test bank account create ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
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

    //print(accountCreated);
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

    //print(token);
    expect(token.length, isNot(0));

    var accountCreated = await quickClient.getPaymentClient().createBankAccountFromToken(
        realmId: realmId,
        requestId: "123456",
        customerId: "2",
        accountToken: "F+hgXXynTwwTi3B70MFysfj/s7o=");

    //print(accountCreated);
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

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().readAllBankAccounts(
        realmId: realmId,
        requestId: "5555",
        customerId: "2"
      );

    //print(response);
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

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().readBankAccount(
        realmId: realmId,
        bankAccountId: "200175477707004247954534",
        customerId: "2"
    );

    //print(response);
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

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().deleteBankAccount(
        realmId: realmId,
        requestId: "1234",
        bankAccountId: "200175477707004247954534",
        customerId: "2"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  // Card
  test('test card create ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var accountCreated = await quickClient.getPaymentClient().createCard(
        realmId: realmId,
        requestId: "123456",
        customerId: "2",
        card: Card.fromJson({
          "expMonth": "12",
          "address": {
            "postalCode": "44112",
            "city": "Richmond",
            "streetAddress": "1245 Hana Rd",
            "region": "VA",
            "country": "US"
          },
          "number": "4408041234567893",
          "name": "Test User",
          "expYear": "2026"
        }));

    //print(accountCreated);
    expect(accountCreated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test card create from token', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var accountCreated = await quickClient.getPaymentClient().createCardFromToken(
        realmId: realmId,
        requestId: "123456",
        customerId: "2",
        cardToken: "F+hgXXynTwwTi3B70MFysfj/s7o=");

    //print(accountCreated);
    expect(accountCreated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read cards ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().readAllCards(
        realmId: realmId,
        requestId: "5555",
        customerId: "2"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read card ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().readCard(
        realmId: realmId,
        cardId: "101103986137004248057893",
        customerId: "2"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test delete card ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().deleteCard(
        realmId: realmId,
        requestId: "1234",
        cardId: "101103986137004248057893",
        customerId: "2"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });
  
  // Charge 
  test('test create charge ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().createCharge(
        realmId: realmId,
        requestId: "12VVXDV34",
      charge: Charge.fromJson({
        "capture": false,
        "currency": "USD",
        "amount": "10.55",
        "context": {
          "mobile": false,
          "isEcommerce": true
        },
        "card": {
          "name": "emulate=0",
          "number": "4111111111111111",
          "expMonth": "02",
          "address": {
            "postalCode": "94086",
            "country": "US",
            "region": "CA",
            "streetAddress": "1130 Kifer Rd",
            "city": "Sunnyvale"
          },
          "expYear": "2022",
          "cvc": "123"
        }
      })
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read refund ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().readRefund(
        realmId: realmId,
        chargeId: "EMU891209421",
        refundId: "EMU891209421"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read charge ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().readCharge(
        realmId: realmId,
        chargeId: "EF5W5TEW3TRG",

    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test refund charge ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().refundCharge(
      realmId: realmId,
      chargeId: "EF5W5TEW3TRG",
      amount: "1.00",
      requestId: "123AAA4",
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test capture charge ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().captureCharge(
      realmId: realmId,
      chargeId: "E9S2UAT2V2JS",
      amount: "10.55",
      requestId: "12VVXVVVDV34",
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test void transaction ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().voidTransaction(
      realmId: realmId,
      requestId: "12VNNNNVVDV34",
      chargeRequestId: "12VVXDV34"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  // ECheck
  test('test create debit ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().createDebit(
        realmId: realmId,
        requestId: "12VVXSSSDV34",
        echeck: ECheck.fromJson({
          "bankAccount": {
            "phone": "1234567890",
            "routingNumber": "490000018",
            "name": "Fname LName",
            "accountType": "PERSONAL_CHECKING",
            "accountNumber": "11000000333456781"
          },
          "description": "Check Auth test call",
          "checkNumber": "12345678",
          "paymentMode": "WEB",
          "amount": "1.11",
          "context": {
            "deviceInfo": {
              "macAddress": "macaddress",
              "ipAddress": "34",
              "longitude": "longitude",
              "phoneNumber": "phonenu",
              "latitude": "",
              "type": "type",
              "id": "1"
            }
          }
        })
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read echeck refund ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().readECheckRefund(
        realmId: realmId,
        refundId: "122",
      echeckId: "amyy7pzn"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read echeck ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().readECheck(
        realmId: realmId,
        echeckId: "amyy7pzn"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test void echeck ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().voidECheck(
        realmId: realmId,
        requestId: "WWEEDDFF",
        echeckId: "amyy7pzn"
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  // Tokens 
  test('test card token ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().createCardToken(
        realmId: realmId,
        requestId: "WWEESSSDDFF",
        card: Card.fromJson({
          "name": "emulate=0",
          "number": "4111111111111111",
          "expMonth": "02",
          "address": {
            "postalCode": "94086",
            "country": "US",
            "region": "CA",
            "streetAddress": "1130 Kifer Rd",
            "city": "Sunnyvale"
          },
          "expYear": "2025",
          "cvc": "123"
        })
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test bank account token ', () async {
    final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
    await quickClient.initialize();

    String token = (await quickClient.refreshToken(
        refreshToken: refreshToken
    )).access_token ?? "";

    //print(token);
    expect(token.length, isNot(0));

    var response = await quickClient.getPaymentClient().createBankAccountToken(
        realmId: realmId,
        requestId: "WWEESSSDDFF",
        bankAccount: BankAccount.fromJson({
          "phone": "6047296480",
          "routingNumber": "021000021",
          "name": "My Checking",
          "accountType": "PERSONAL_CHECKING",
          "accountNumber": "12334534"
        })
    );

    //print(response);
    expect(response, isNotNull);
    expect(quickClient.isInitialized(), true);
  });
}