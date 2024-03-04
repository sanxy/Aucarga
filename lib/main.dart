import 'package:etcetera/app/router.dart';
import 'package:etcetera/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'screens/onboard/splash_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  setupLogger();

  runApp(MyApp());
}



class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed){
      // await FlutterPrivacyScreen.disablePrivacyScreen();
    }else{
      // await FlutterPrivacyScreen.enablePrivacyScreen();
    }
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'ETCETERA',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,

      home: const SplashScreen(),
    );
  }
}
