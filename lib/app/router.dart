import 'package:etcetera/screens/auth/account_done/account_done_view.dart';
import 'package:etcetera/screens/auth/verify_phone/verify_phone_view.dart';
import 'package:etcetera/screens/start/start_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/auth/about_yourself/personal_detail.dart';
import '../screens/auth/login/login.dart';
import '../screens/auth/phone/phone_view.dart';
import '../screens/dashboard/dashboard_view.dart';
import '../screens/onboard/onboarding.dart';


abstract class Routes {
  static const startupViewRoute = '/start-up';
  static const dashboardViewRoute = '/dashboard';
  static const loginViewRoute = '/login';
  static const onboardingViewRoute = '/onboarding';
  static const phoneViewRoute = '/phone';
  static const verifyPhoneViewRoute = '/verify-phone';
  static const personalDetailViewRoute = '/personal-detail';
  static const accountDoneViewRoute = '/account-done';

}

class Routers {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboardViewRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const DashboardView(), settings: settings);
      case Routes.loginViewRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const Login(), settings: settings);
      case Routes.onboardingViewRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => Onboarding(), settings: settings);
      case Routes.startupViewRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => StartUpScreen(), settings: settings);
      case Routes.phoneViewRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => PhoneView(), settings: settings);

    case Routes.verifyPhoneViewRoute:
      String phoneNumber = settings.arguments as String;
    return CupertinoPageRoute<dynamic>(
    builder: (context) => VerifyPhoneView(phone: phoneNumber),
    settings: settings);

      case Routes.personalDetailViewRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const PersonalDetail(), settings: settings);
      case Routes.accountDoneViewRoute:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const AccountDoneView(), settings: settings);

      default:
        return unknownRoutePage(settings.name);

    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String? routeName) => CupertinoPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == "/"
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.transparent),
                ),
                child: const Text("Back"),
              )
            ],
          ),
        ),
      ),
    );
