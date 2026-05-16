

import 'package:go_router/go_router.dart';
import 'package:sant_flutter_appp/screens/change_password/change_password_screen.dart';
import 'package:sant_flutter_appp/screens/event/add_event_screen.dart';
import 'package:sant_flutter_appp/screens/event/event_list_screen.dart';
import 'package:sant_flutter_appp/screens/forgot_password/forgot_password_screen.dart';
import 'package:sant_flutter_appp/screens/forgot_password/reset_password_screen.dart';
import 'package:sant_flutter_appp/screens/home/home_screen.dart';
import 'package:sant_flutter_appp/screens/login/login_screen.dart';
import 'package:sant_flutter_appp/screens/otp/otp_screen.dart';
import 'package:sant_flutter_appp/screens/profile/edit_profile_screen.dart';
import 'package:sant_flutter_appp/screens/profile/profile_screen.dart';
import 'package:sant_flutter_appp/screens/register/register_screen.dart';
import 'package:sant_flutter_appp/screens/sant/sant_list_screen.dart';

import '../screens/splash_screen.dart';

const splashScreenRoute = "/SplashScreenRoute";
const loginScreenRoute = "/LoginScreen";
const registerScreenRoute = "/RegisterScreen";
const forgotPasswordScreenRoute = "/ForgotPassword";
const otpScreenRoute = "/OtpScreen";
const changePasswordScreenRoute = "/ChangePasswordScreen";
const resetPasswordScreenRoute = "/ResetPasswordScreen";
const homeScreenRoute = "/HomeScreen";
const profileScreenRoute = "/ProfileScreen";
const editProfileScreenRoute = "/EditProfile";
const santListScreenRoute = "/SantListScreen";
const eventListScreenRoute = "/EventListScreen";
const addEventScreenRoute = "/AddEventScreen";


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
        ),
        GoRoute(
            path: homeScreenRoute,
            name: homeScreenRoute,
            builder: (context,state) => HomeScreen()
        ),
        GoRoute(
            path: profileScreenRoute,
            name: profileScreenRoute,
            builder: (context,state) => ProfileScreen()
        ),
        GoRoute(
            path: editProfileScreenRoute,
            name: editProfileScreenRoute,
            builder: (context,state) => EditProfileScreen()
        ),
        GoRoute(
            path: santListScreenRoute,
            name: santListScreenRoute,
            builder: (context,state) => SantListScreen()
        ),
        GoRoute(
            path: eventListScreenRoute,
            name: eventListScreenRoute,
            builder: (context,state) => EventListScreen()
        ),
        GoRoute(
            path: addEventScreenRoute,
            name: addEventScreenRoute,
            builder: (context,state) => AddEventScreen()
        )
      ]
  );

}