import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/locator.dart';
import '../../app/router.dart';
import '../../core/services/utility_storage_service.dart';

class StartUpScreenViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();


  bool get isLoggedIn =>  _storageService.getBool('isLoggedIn') ?? false;
  bool get skipOnBoarding => _storageService.getBool('skipOnBoarding') ?? false;

  void setup() async {
    Future.delayed(const Duration(seconds: 2), () async {
      // navigateToView();
    });
  }

  void navigateToGetStarted() {
    Future.delayed(const Duration(milliseconds: 210),
            () => _navigationService.navigateTo(Routes.phoneViewRoute));
  }

  void navigateToLogin() {
    Future.delayed(const Duration(milliseconds: 210),
            () => _navigationService.replaceWith(Routes.loginViewRoute));

  }

}
