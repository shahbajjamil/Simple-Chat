import 'package:flutter/material.dart';

import 'features/login/phone_login/otp_Input_screen.dart';
import 'features/login/phone_login/phone_login_screen.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case PhoneLoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const PhoneLoginScreen());
    case OtpInputScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const OtpInputScreen(), settings: settings);

    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
