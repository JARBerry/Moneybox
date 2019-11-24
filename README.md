# Moneybox

## ViewController - Login Screen

From login retrieves name and token from header http request and retrieves totalPlanValue from detail http request

## UserAccountsViewController

Retrieved header and detail url requests ran out of time to manage http status and dispatch queue screen refresh.

Retrieved id, moneybox, plan value and account name from the detail and passed through to the IndividualAccountsViewController.

## IndividualAccountsViewController

Retrieved header again incase of bearer token expires and made POST http request to make payment for selected account.


## HeaderInfo
Used JSON codable to perform POST request and pass info back through completion handler. Successfully extracted bearer token information. 

## DetailInfo
Used JSON codable to perform GET request and successfully extracted information needed for savings accounts.

## PaymentInfo
Used JSON codable to perform POST request and successfully posted payments to the selected account information.

## Constants
This the constants file and this basically helps me not having to hard code values in.

## Main storyboard
This has auto layouts and constraints. Also has segues, buttons, images and multiple views.

## LaunchScreen
This has my launch screen that I made and displays when app is started.

## App Icon
Has App icons that I made.


