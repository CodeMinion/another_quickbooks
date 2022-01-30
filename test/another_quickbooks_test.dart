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


  // Accounts
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

  // Company Info
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

  // Bill
  test('test query bill ', () async {
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

    var resultsFound = await quickClient.getAccountingClient().queryBill(
        realmId: realmId,
        query: "select * from Bill where Metadata.CreateTime > '2014-12-31'"
    );

    print(resultsFound);
    expect(resultsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read bill ', () async {
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

    var found = await quickClient.getAccountingClient().readBill(
      realmId: realmId,
      billId: "25",
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test update bill ', () async {
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

    //
    var updated = await quickClient.getAccountingClient().updateBill(
        realmId: realmId,
        bill: Bill.fromJson({
          "DocNumber": "56789",
          "SyncToken": "1",
          "domain": "QBO",
          "APAccountRef": {
            "name": "Accounts Payable",
            "value": "49"
          },
          "VendorRef": {
            "name": "Bayshore CalOil Service",
            "value": "81"
          },
          "TxnDate": "2014-04-04",
          "TotalAmt": 200.0,
          "CurrencyRef": {
            "name": "United States Dollar",
            "value": "USD"
          },
          "PrivateNote": "This is a updated memo.",
          "SalesTermRef": {
            "value": "12"
          },
          "DepartmentRef": {
            "name": "Garden Services",
            "value": "1"
          },
          "DueDate": "2013-06-09",
          "sparse": false,
          "Line": [
            {
              "DetailType": "AccountBasedExpenseLineDetail",
              "Amount": 200.0,
              "Id": "1",
              "AccountBasedExpenseLineDetail": {
                "TaxCodeRef": {
                  "value": "TAX"
                },
                "AccountRef": {
                  "name": "Automobile",
                  "value": "75"
                },
                "BillableStatus": "Billable",
                "CustomerRef": {
                  "name": "Blackwell, Edward",
                  "value": "20"
                },
                "MarkupInfo": {
                  "Percent": 10
                }
              },
              "Description": "Gasoline"
            }
          ],
          "Balance": 200.0,
          "Id": "890",
          "MetaData": {
            "CreateTime": "2014-04-04T12:38:01-07:00",
            "LastUpdatedTime": "2014-04-04T12:48:56-07:00"
          }
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test create bill ', () async {
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

    //
    var updated = await quickClient.getAccountingClient().createBill(
        realmId: realmId,
        bill: Bill.fromJson({
          "Line": [
            {
              "DetailType": "AccountBasedExpenseLineDetail",
              "Amount": 200.0,
              "Id": "1",
              "AccountBasedExpenseLineDetail": {
                "AccountRef": {
                  "value": "7"
                }
              }
            }
          ],
          "VendorRef": {
            "value": "56"
          }
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test delete bill ', () async {
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

    var found = await quickClient.getAccountingClient().deleteBill(
      realmId: realmId,
      bill: Bill(id: "108", syncToken: "0"),
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  // Customer
  test('test query customer ', () async {
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

    var resultsFound = await quickClient.getAccountingClient().queryCustomer(
        realmId: realmId,
        query: "select * from Customer where Metadata.CreateTime > '2014-12-31'"
    );

    print(resultsFound);
    expect(resultsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read customer ', () async {
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

    var found = await quickClient.getAccountingClient().readCustomer(
      realmId: realmId,
      customerId: "2",
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test update customer ', () async {
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

    //
    var updated = await quickClient.getAccountingClient().updateCustomer(
        realmId: realmId,
        customer: Customer.fromJson({
          "MiddleName": "Mark",
          "SyncToken": "0",
          "Id": "2",
          "sparse": true
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test create customer ', () async {
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

    //
    var updated = await quickClient.getAccountingClient().createCustomer(
        realmId: realmId,
        customer: Customer.fromJson({
          "FullyQualifiedName": "King Groceries",
          "PrimaryEmailAddr": {
            "Address": "jdrew@myemail.com"
          },
          "DisplayName": "King's Groceries",
          "Suffix": "Jr",
          "Title": "Mr",
          "MiddleName": "B",
          "Notes": "Here are other details.",
          "FamilyName": "King",
          "PrimaryPhone": {
            "FreeFormNumber": "(555) 555-5555"
          },
          "CompanyName": "King Groceries",
          "BillAddr": {
            "CountrySubDivisionCode": "CA",
            "City": "Mountain View",
            "PostalCode": "94042",
            "Line1": "123 Main Street",
            "Country": "USA"
          },
          "GivenName": "James"
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  // Employee
  test('test query employee ', () async {
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

    var resultsFound = await quickClient.getAccountingClient().queryEmployee(
        realmId: realmId,
        query: "select * from Employee where Metadata.CreateTime > '2014-12-31'"
    );

    print(resultsFound);
    expect(resultsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read employee ', () async {
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

    var found = await quickClient.getAccountingClient().readEmployee(
      realmId: realmId,
      employeeId: "55",
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test update employee ', () async {
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

    //
    var updated = await quickClient.getAccountingClient().updateEmployee(
        realmId: realmId,
        employee: Employee.fromJson({
          "SyncToken": "0",
          "domain": "QBO",
          "DisplayName": "Bill Miller",
          "PrimaryPhone": {
            "FreeFormNumber": "234-525-1234"
          },
          "PrintOnCheckName": "Bill Lee Miller",
          "FamilyName": "Miller",
          "Active": true,
          "SSN": "XXX-XX-XXXX",
          "PrimaryAddr": {
            "CountrySubDivisionCode": "CA",
            "City": "Middlefield",
            "PostalCode": "93242",
            "Id": "116",
            "Line1": "45 N. Elm Street"
          },
          "sparse": false,
          "BillableTime": false,
          "GivenName": "Bill",
          "Id": "71",
          "MetaData": {
            "CreateTime": "2015-07-24T09:34:35-07:00",
            "LastUpdatedTime": "2015-07-24T09:34:35-07:00"
          }
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test create employee ', () async {
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

    //
    var updated = await quickClient.getAccountingClient().createEmployee(
        realmId: realmId,
        employee: Employee.fromJson({
          "GivenName": "John",
          "SSN": "444-55-6666",
          "PrimaryAddr": {
            "CountrySubDivisionCode": "CA",
            "City": "Middlefield",
            "PostalCode": "93242",
            "Id": "50",
            "Line1": "45 N. Elm Street"
          },
          "PrimaryPhone": {
            "FreeFormNumber": "408-525-1234"
          },
          "FamilyName": "Meuller"
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  // Estimate
  test('test query estimate ', () async {
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

    var resultsFound = await quickClient.getAccountingClient().queryEstimate(
        realmId: realmId,
        query: "select * from Estimate where Metadata.CreateTime > '2014-12-31'"
    );

    print(resultsFound);
    expect(resultsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read estimate ', () async {
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

    var found = await quickClient.getAccountingClient().readEstimate(
      realmId: realmId,
      estimateId: "41",
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test update estimate ', () async {
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


    var updated = await quickClient.getAccountingClient().updateEstimate(
        realmId: realmId,
        estimate: Estimate.fromJson({
          "DocNumber": "1001",
          "SyncToken": "2",
          "domain": "QBO",
          "TxnStatus": "Closed",
          "BillEmail": {
            "Address": "Geeta@Kalapatapu.com"
          },
          "TxnDate": "2014-09-07",
          "TotalAmt": 582.5,
          "CustomerRef": {
            "name": "Geeta Kalapatapu",
            "value": "10"
          },
          "CustomerMemo": {
            "value": "An updated memo via full update."
          },
          "ShipAddr": {
            "CountrySubDivisionCode": "CA",
            "City": "Middlefield",
            "PostalCode": "94303",
            "Id": "119",
            "Line1": "1987 Main St."
          },
          "LinkedTxn": [
            {
              "TxnId": "103",
              "TxnType": "Invoice"
            }
          ],
          "PrintStatus": "NeedToPrint",
          "BillAddr": {
            "Line3": "Middlefield, CA  94303",
            "Id": "59",
            "Line1": "Geeta Kalapatapu",
            "Line2": "1987 Main St."
          },
          "sparse": false,
          "EmailStatus": "NotSet",
          "Line": [
            {
              "Description": "Rock Fountain",
              "DetailType": "SalesItemLineDetail",
              "SalesItemLineDetail": {
                "TaxCodeRef": {
                  "value": "NON"
                },
                "Qty": 1,
                "UnitPrice": 275,
                "ItemRef": {
                  "name": "Rock Fountain",
                  "value": "5"
                }
              },
              "LineNum": 1,
              "Amount": 275.0,
              "Id": "1"
            },
            {
              "Description": "Custom Design",
              "DetailType": "SalesItemLineDetail",
              "SalesItemLineDetail": {
                "TaxCodeRef": {
                  "value": "NON"
                },
                "Qty": 3.5,
                "UnitPrice": 75,
                "ItemRef": {
                  "name": "Design",
                  "value": "4"
                }
              },
              "LineNum": 2,
              "Amount": 262.5,
              "Id": "2"
            },
            {
              "Description": "Fountain Pump",
              "DetailType": "SalesItemLineDetail",
              "SalesItemLineDetail": {
                "TaxCodeRef": {
                  "value": "NON"
                },
                "Qty": 2,
                "UnitPrice": 22.5,
                "ItemRef": {
                  "name": "Pump",
                  "value": "11"
                }
              },
              "LineNum": 3,
              "Amount": 45.0,
              "Id": "3"
            },
            {
              "DetailType": "SubTotalLineDetail",
              "Amount": 582.5,
              "SubTotalLineDetail": {}
            }
          ],
          "ApplyTaxAfterDiscount": false,
          "CustomField": [
            {
              "DefinitionId": "1",
              "Type": "StringType",
              "Name": "Crew #"
            }
          ],
          "Id": "41",
          "TxnTaxDetail": {
            "TotalTax": 0
          },
          "MetaData": {
            "CreateTime": "2014-09-17T11:20:06-07:00",
            "LastUpdatedTime": "2015-07-24T14:08:04-07:00"
          }
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test create estimate ', () async {
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

    //
    var updated = await quickClient.getAccountingClient().createEstimate(
        realmId: realmId,
        estimate: Estimate.fromJson({
          "TotalAmt": 31.5,
          "BillEmail": {
            "Address": "Cool_Cars@intuit.com"
          },
          "CustomerMemo": {
            "value": "Thank you for your business and have a great day!"
          },
          "ShipAddr": {
            "City": "Half Moon Bay",
            "Line1": "65 Ocean Dr.",
            "PostalCode": "94213",
            "Lat": "37.4300318",
            "Long": "-122.4336537",
            "CountrySubDivisionCode": "CA",
            "Id": "4"
          },
          "PrintStatus": "NeedToPrint",
          "EmailStatus": "NotSet",
          "BillAddr": {
            "City": "Half Moon Bay",
            "Line1": "65 Ocean Dr.",
            "PostalCode": "94213",
            "Lat": "37.4300318",
            "Long": "-122.4336537",
            "CountrySubDivisionCode": "CA",
            "Id": "4"
          },
          "Line": [
            {
              "Description": "Pest Control Services",
              "DetailType": "SalesItemLineDetail",
              "SalesItemLineDetail": {
                "TaxCodeRef": {
                  "value": "NON"
                },
                "Qty": 1,
                "UnitPrice": 35,
                "ItemRef": {
                  "name": "Pest Control",
                  "value": "10"
                }
              },
              "LineNum": 1,
              "Amount": 35.0,
              "Id": "1"
            },
            {
              "DetailType": "SubTotalLineDetail",
              "Amount": 35.0,
              "SubTotalLineDetail": {}
            },
            {
              "DetailType": "DiscountLineDetail",
              "Amount": 3.5,
              "DiscountLineDetail": {
                "DiscountAccountRef": {
                  "name": "Discounts given",
                  "value": "86"
                },
                "PercentBased": true,
                "DiscountPercent": 10
              }
            }
          ],
          "CustomerRef": {
            "name": "Cool Cars",
            "value": "3"
          },
          "TxnTaxDetail": {
            "TotalTax": 0
          },
          "ApplyTaxAfterDiscount": false
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test delete estimate ', () async {
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

    var found = await quickClient.getAccountingClient().deleteEstimate(
      realmId: realmId,
      estimate: Estimate.fromJson({
        "SyncToken": "3",
        "Id": "96"
      })
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test get estimate pdf ', () async {
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

    var found = await quickClient.getAccountingClient().getEstimatePdf(
        realmId: realmId,
        estimateId: "41"
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test send estimate pdf ', () async {
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

    var found = await quickClient.getAccountingClient().sendEstimate(
        realmId: realmId,
        estimateId: "41",
        emailTo: "hernandez.frank@gmail.com"
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  // Invoice
  test('test query invoice ', () async {
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

    var resultsFound = await quickClient.getAccountingClient().queryInvoice(
        realmId: realmId,
        query: "select * from Invoice where Metadata.CreateTime > '2014-12-31'"
    );

    print(resultsFound);
    expect(resultsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read invoice ', () async {
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

    var found = await quickClient.getAccountingClient().readInvoice(
      realmId: realmId,
      invoiceId: "130",
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test update invoice ', () async {
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


    var updated = await quickClient.getAccountingClient().updateInvoice(
        realmId: realmId,
        invoice: Invoice.fromJson({
          "DocNumber": "1070",
          "SyncToken": "0",
          "domain": "QBO",
          "Balance": 150.0,
          "BillAddr": {
            "City": "Bayshore",
            "Line1": "4581 Finch St.",
            "PostalCode": "94326",
            "Lat": "INVALID",
            "Long": "INVALID",
            "CountrySubDivisionCode": "CA",
            "Id": "2"
          },
          "TxnDate": "2015-07-24",
          "TotalAmt": 150.0,
          "CustomerRef": {
            "name": "Amy's Bird Sanctuary",
            "value": "1"
          },
          "CustomerMemo": {
            "value": "Added customer memo."
          },
          "ShipAddr": {
            "City": "Bayshore",
            "Line1": "4581 Finch St.",
            "PostalCode": "94326",
            "Lat": "INVALID",
            "Long": "INVALID",
            "CountrySubDivisionCode": "CA",
            "Id": "109"
          },
          "LinkedTxn": [],
          "DueDate": "2015-08-23",
          "PrintStatus": "NeedToPrint",
          "EmailStatus": "NotSet",
          "sparse": false,
          "Line": [
            {
              "LineNum": 1,
              "Amount": 150.0,
              "SalesItemLineDetail": {
                "TaxCodeRef": {
                  "value": "NON"
                },
                "ItemRef": {
                  "name": "Services",
                  "value": "1"
                }
              },
              "Id": "1",
              "DetailType": "SalesItemLineDetail"
            },
            {
              "DetailType": "SubTotalLineDetail",
              "Amount": 150.0,
              "SubTotalLineDetail": {}
            }
          ],
          "ApplyTaxAfterDiscount": false,
          "CustomField": [
            {
              "DefinitionId": "1",
              "Type": "StringType",
              "Name": "Crew #"
            }
          ],
          "Id": "239",
          "TxnTaxDetail": {
            "TotalTax": 0
          },
          "MetaData": {
            "CreateTime": "2015-07-24T10:35:08-07:00",
            "LastUpdatedTime": "2015-07-24T10:35:08-07:00"
          }
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test create invoice ', () async {
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

    //
    var updated = await quickClient.getAccountingClient().createInvoice(
        realmId: realmId,
        invoice: Invoice.fromJson({
          "Line": [
            {
              "DetailType": "SalesItemLineDetail",
              "Amount": 100.0,
              "SalesItemLineDetail": {
                "ItemRef": {
                  "name": "Services",
                  "value": "1"
                }
              }
            }
          ],
          "CustomerRef": {
            "value": "1"
          }
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test delete invoice ', () async {
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

    var found = await quickClient.getAccountingClient().deleteInvoice(
        realmId: realmId,
        invoice: Invoice.fromJson({
          "SyncToken": "3",
          "Id": "33"
        })
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test get invoice pdf ', () async {
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

    var found = await quickClient.getAccountingClient().getInvoicePdf(
        realmId: realmId,
        invoiceId: "130"
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test send invoice pdf ', () async {
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

    var found = await quickClient.getAccountingClient().sendInvoice(
        realmId: realmId,
        invoiceId: "130",
        emailTo: "hernandez.frank@gmail.com"
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test void invoice ', () async {
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

    var found = await quickClient.getAccountingClient().voidInvoice(
        realmId: realmId,
        invoice: Invoice.fromJson({
          "SyncToken": "0",
          "Id": "129"
        })
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  // Item
  test('test query item ', () async {
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

    var resultsFound = await quickClient.getAccountingClient().queryItem(
        realmId: realmId,
        query: "select * from Item where Metadata.CreateTime > '2014-12-31'"
    );

    print(resultsFound);
    expect(resultsFound, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test read item ', () async {
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

    var found = await quickClient.getAccountingClient().readItem(
      realmId: realmId,
      itemId: "14",
    );

    print(found);
    expect(found, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test update item ', () async {
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


    var updated = await quickClient.getAccountingClient().updateItem(
        realmId: realmId,
        item: Item.fromJson({
          "FullyQualifiedName": "Rock Fountain",
          "domain": "QBO",
          "Id": "5",
          "Name": "Rock Fountain",
          "TrackQtyOnHand": true,
          "Type": "Inventory",
          "PurchaseCost": 125,
          "QtyOnHand": 2,
          "IncomeAccountRef": {
            "name": "Sales of Product Income",
            "value": "79"
          },
          "AssetAccountRef": {
            "name": "Inventory Asset",
            "value": "81"
          },
          "Taxable": true,
          "MetaData": {
            "CreateTime": "2014-09-16T10:42:19-07:00",
            "LastUpdatedTime": "2014-09-19T13:16:17-07:00"
          },
          "sparse": false,
          "Active": true,
          "SyncToken": "2",
          "InvStartDate": "2014-09-19",
          "UnitPrice": 275,
          "ExpenseAccountRef": {
            "name": "Cost of Goods Sold",
            "value": "80"
          },
          "PurchaseDesc": "Rock Fountain",
          "Description": "New, updated description for Rock Fountain"
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });

  test('test create item ', () async {
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

    var updated = await quickClient.getAccountingClient().createItem(
        realmId: realmId,
        item: Item.fromJson({
          "TrackQtyOnHand": true,
          "Name": "Garden Supplies",
          "QtyOnHand": 10,
          "IncomeAccountRef": {
            "name": "Sales of Product Income",
            "value": "79"
          },
          "AssetAccountRef": {
            "name": "Inventory Asset",
            "value": "81"
          },
          "InvStartDate": "2015-01-01",
          "Type": "Inventory",
          "ExpenseAccountRef": {
            "name": "Cost of Goods Sold",
            "value": "80"
          }
        })
    );

    print(updated);
    expect(updated, isNotNull);
    expect(quickClient.isInitialized(), true);
  });


}
