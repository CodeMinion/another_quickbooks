# Another Quickbooks
Flutter package for Quickbooks. Includes supports for both Payments and Accounting APIs
as well as authorization flow.

## Quickbooks Payments

| Feature | Supported   | URL  |
|---|:---:|---|
| Bank Accounts  | Y  | https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/bankaccounts  |
| Cards  | Y  |https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/cards  |
| Charges  | Y  | https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/charges  |
| EChecks  | Y  | https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/echecks  |
| Token  | Y  | https://developer.intuit.com/app/developer/qbpayments/docs/api/resources/all-entities/tokens  |

## Quickbooks Accounting

| Feature | Supported   | URL  |
|---|:---:|---|
| Accounts  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/account  |
| Bill  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/bill  |
| Company Info  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/companyinfo  |
| Customer  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/customer  |
| Employee  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/employee  |
| Estimate  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/estimate  |
| Invoice  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/invoice  |
| Item  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/item  |
| Payment  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/payment  |
| Preferences  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/preferences  |
| Profit And Loss  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/profitandloss  |
| Tax Agency  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/taxagency  |
| Vendor  | Y  | https://developer.intuit.com/app/developer/qbo/docs/api/accounting/most-commonly-used/vendor  |

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Credentials

In order to interact with Quickbooks you'll need a developer account and the clientId and clientSecret https://developer.intuit.com/app/developer/dashboard

```dart
final quickClient = QuickbooksClient(
        applicationId: applicationId,
        clientId: clientId,
        clientSecret: clientSecret);
// Initialize the client.        
await quickClient.initialize();

// Use this to prompt the user to authorize your app
var authUrl = quickClient.getAuthorizationPageUrl(
        scopes: [Scope.Accounting, Scope.Payments],         
        redirectUrl: <your redirect url>, 
        state: "state123")

// On authorization success use the params to get the access token.
var autoToken = quickClient.getAuthToken(
        code: <code from redirect url>,
        realmId: <real from redirect url>
        redirectUrl: <redirect url>);
        
// Note: The token can be refreshed when it expires using the refreshToken
String token = (await quickClient.refreshToken(
        refreshToken: autoToken.refresh_token
    )).access_token
```

## Quickbooks Developer Docs
https://developer.intuit.com/app/developer/qbo/docs/develop


# Brother Hackathon
Feel free to use any of my GitHub repositories in your apps. You should also consider
attending the free Brother Hackathon happening this year. You get a free Brother QL-1110NWB,
a PT-P910BT, and possibly an awesome DS-940DW mobile scanner. Visit brotherhackathon.com for
more information. I will be teaching workshops, and they are free. You can ask me any questions.
Thank you.