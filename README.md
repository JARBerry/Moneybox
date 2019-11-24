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

<img width="411" alt="Screenshot 2019-11-24 at 17 43 22" src="https://user-images.githubusercontent.com/36542195/69499014-f6d9f400-0ee5-11ea-824a-36529f3b95ff.png">
<img width="411" alt="Screenshot 2019-11-24 at 17 44 17" src="https://user-images.githubusercontent.com/36542195/69499015-f93c4e00-0ee5-11ea-9419-08197edaca6e.png">
<img width="411" alt="Screenshot 2019-11-24 at 17 48 21" src="https://user-images.githubusercontent.com/36542195/69499016-fc373e80-0ee5-11ea-8694-8264d5aff946.png">
<img width="411" alt="Screenshot 2019-11-24 at 17 48 43" src="https://user-images.githubusercontent.com/36542195/69499018-ffcac580-0ee5-11ea-99ba-8c29d8aef37c.png">
<img width="411" alt="Screenshot 2019-11-24 at 17 49 14" src="https://user-images.githubusercontent.com/36542195/69499019-02c5b600-0ee6-11ea-9845-357e7f396e9b.png">
<img width="411" alt="Screenshot 2019-11-24 at 17 54 34" src="https://user-images.githubusercontent.com/36542195/69499022-05281000-0ee6-11ea-87b4-63925efa3bed.png">

