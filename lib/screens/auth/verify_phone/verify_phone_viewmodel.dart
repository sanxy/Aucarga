import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:timer_count_down/timer_controller.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';



class VerifyPhoneViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  TextEditingController otpController = TextEditingController();
  bool isResendCodeEnable = false;
  late CountdownController countdownController;


  Future<void> setup({bool isDeviceVerification = false}) async {
    // dPrint('yes fola:::: $phoneNumber');
    countdownController = CountdownController(autoStart: true);
    notifyListeners();

  }

  Future<void> verifyOtp(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 3),
            () {
              isLoading = false;
              notifyListeners();
              return _navigationService.navigateTo(Routes.personalDetailViewRoute);
            });
  }

}

