import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';
import '../core/services/utility_storage_service.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false})async {
  Directory appDocDir = test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  
  if(!test) {
    locator.registerLazySingleton<HiveInterface>(() => Hive);
  }
  locator.registerLazySingleton<NavigationService>(
    () => NavigationService()
  );
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );

  locator.registerLazySingleton<StorageService>(
    () => StorageService()
  );


  // Logger.d('Initializing boxes...');
  await StorageService().init();
}