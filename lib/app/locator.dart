import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';
import '../core/enums/snack_bar_type.dart';
import '../core/services/utility_storage_service.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator({bool test = false})async {
  Directory appDocDir = test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  final snackBarService = SnackbarService();

  snackBarService.registerCustomSnackbarConfig(
    variant: SnackBarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      textColor: Colors.white,
      titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      messageTextStyle: const TextStyle(fontSize: 14),
      icon: const Icon(Icons.check, color: Colors.white),
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
    ),
  );

  snackBarService.registerCustomSnackbarConfig(
    variant: SnackBarType.info,
    config: SnackbarConfig(
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      messageTextStyle: const TextStyle(fontSize: 14),
      icon: const Icon(Icons.info_outline, color: Colors.white),
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
    ),
  );

  snackBarService.registerCustomSnackbarConfig(
    variant: SnackBarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      messageTextStyle: const TextStyle(fontSize: 14),
      icon: const Icon(Icons.error_outline, color: Colors.white),
      borderRadius: 4,
      margin: const EdgeInsets.all(8),
    ),
  );
  
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
    () => snackBarService,
  );

  locator.registerLazySingleton<StorageService>(
    () => StorageService()
  );


  // Logger.d('Initializing boxes...');
  await StorageService().init();



}