import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sant_flutter_appp/providers/ThemeProvider.dart';
import 'package:sant_flutter_appp/routes/AppRoutes.dart';
import 'package:sant_flutter_appp/utils/ColorUtils.dart';
import 'package:sant_flutter_appp/utils/PreferenceUtils.dart';
import 'package:sant_flutter_appp/utils/StringUtils.dart';

import 'cubits/internet/internet_cubit.dart';
import 'di/service_locator.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.getInstance();
  await PreferenceUtils.getInstanceTheme();
  await initDependencies();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: colorWhite,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<InternetCubit>()),
        ],
        child: MaterialApp.router(
          routerConfig: AppRoutes.router,
          restorationScopeId: null,
          debugShowCheckedModeBanner: false,
          title: appName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
