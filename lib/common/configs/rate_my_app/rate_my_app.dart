import 'package:rate_my_app/rate_my_app.dart';

const String appStoreIdentifier =
    "https://apps.apple.com/app/id6479211816?action=write-review";
const String googlePlayIdentifier = "com.hdpsolution.quanlychitieu";

RateMyApp rateMyApp = RateMyApp(
  preferencesPrefix: 'rateMyApp_',
  minDays: 3,
  minLaunches: 7,
  remindDays: 2,
  remindLaunches: 5,
  googlePlayIdentifier: googlePlayIdentifier,
  appStoreIdentifier: appStoreIdentifier,
);
