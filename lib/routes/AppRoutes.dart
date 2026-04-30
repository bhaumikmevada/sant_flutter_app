

import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/screens/change_password/change_password_screen.dart';
import 'package:sant_flutter_appp/screens/forgot_password/forgot_password_screen.dart';
import 'package:sant_flutter_appp/screens/forgot_password/reset_password_screen.dart';
import 'package:sant_flutter_appp/screens/login/login_screen.dart';
import 'package:sant_flutter_appp/screens/otp/otp_screen.dart';
import 'package:sant_flutter_appp/screens/register/register_screen.dart';

import '../screens/splash_screen.dart';

const splashScreenRoute = "/SplashScreenRoute";
const loginScreenRoute = "/LoginScreen";
const registerScreenRoute = "/RegisterScreen";
const forgotPasswordScreenRoute = "/ForgotPassword";
const otpScreenRoute = "/OtpScreen";
const changePasswordScreenRoute = "/ChangePasswordScreen";
const resetPasswordScreenRoute = "/ResetPasswordScreen";

class AppRoutes{

  static final GoRouter router = GoRouter(
      initialLocation: splashScreenRoute,
      routes: [
        GoRoute(
            path: splashScreenRoute,
            name: splashScreenRoute,
            builder: (context,state) => SplashScreen()
        ),
        GoRoute(
            path: loginScreenRoute,
            name: loginScreenRoute,
            builder: (context,state) => LoginScreen()
        ),
        GoRoute(
            path: registerScreenRoute,
            name: registerScreenRoute,
            builder: (context,state) => RegisterScreen()
        ),
        GoRoute(
            path: forgotPasswordScreenRoute,
            name: forgotPasswordScreenRoute,
            builder: (context,state) => ForgotPasswordScreen()
        ),
        GoRoute(
          path: otpScreenRoute,
          name: otpScreenRoute,
          builder: (context,state) => OtpScreen()
        ),
        GoRoute(
            path: resetPasswordScreenRoute,
            name: resetPasswordScreenRoute,
            builder: (context,state) => ResetPasswordScreen()
        ),
        GoRoute(
            path: changePasswordScreenRoute,
            name: changePasswordScreenRoute,
            builder: (context,state) => ChangePasswordScreen()
        )
      ]
  );

}