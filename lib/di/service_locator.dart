
import 'package:connectivity_plus/connectivity_plus.dart' show Connectivity;
import 'package:get_it/get_it.dart';

import '../cubits/internet/internet_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async{

  sl.registerFactory(()=> InternetCubit(connectivity: Connectivity()));

}