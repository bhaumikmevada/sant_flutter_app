

import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/screens/forgot_password/forgot_password_screen.dart';
import 'package:sant_flutter_appp/screens/login/login_screen.dart';
import 'package:sant_flutter_appp/screens/register/register_screen.dart';

import '../screens/splash_screen.dart';

const splashScreenRoute = "/SplashScreenRoute";
const loginScreenRoute = "/LoginScreen";
const registerScreenRoute = "/RegisterScreen";
const forgotPasswordScreenRoute = "/ForgotPassword";

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
    ]
  );

}