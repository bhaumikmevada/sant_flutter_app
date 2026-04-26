import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:sant_flutter_appp/utils/ImageUtils.dart';
import 'package:uuid/uuid.dart';
import '../providers/ThemeProvider.dart';
import '../routes/AppRoutes.dart';
import '../utils/ColorUtils.dart';
import '../utils/Utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      _redirectScreen(context);

    });
  }

  void _redirectScreen(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () async {
      context.go(loginScreenRoute);
      // if(PreferenceUtils.getString(PREF_USER_ID).isNotEmpty){
      //   context.go(groupListScreenRoute);
      // }else{
      //   context.go(loginScreenRoute);
      // }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: colorWhite,
      body: Center(
        child: SvgPicture.asset(appLogo,width: 100,height: 100,),
      ),
    );
  }
}
