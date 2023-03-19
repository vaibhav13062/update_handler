This Package can be used for checking and keep you app updated.

## Features

- Auto Redirect to AppStore/PlayStore
- Force Update (on force updating popup can't be closed or dismissed)
- Cupertino/Material Designs.

## Getting started

No prerequisites required.
But you can add Android package name and iOS appId manually. (NOT REQUIRED).

```dart
UpdateHandler.androidAppId="nic.goi.aarogyasetu";
UpdateHandler.iosAppId="1614787047";
```

## Usage

You just need to pass latestBuildNo,lastForceBuildNo,BuildContext , title & content are optional.


```dart
UpdateHandler().isUpdateAvailable(latestBuildNo: 11, lastForceBuildNo: 10, context: context,onNotNowClick: () {});
```
OR
```dart
UpdateHandler().isUpdateAvailable(
latestBuildNo: 11,
lastForceBuildNo: 10,
context: context,
onNotNowClick: () {},
title: "UPDATE NOW",
content: "NEW APP UPDATE AVAILABLE PLEASE UPDATE ASAP");
```

## Additional information

- Made by :- Vaibhav Chandolia
- Email:- chandolia.vaibhav@gmail.com
- Website:- vaibhavchandolia.info
