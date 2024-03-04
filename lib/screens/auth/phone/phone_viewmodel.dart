import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';



class PhoneViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;


  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  String phoneNumber = "";

  Future<void> setup({bool isDeviceVerification = false}) async {

  }

  void getPhoneNumber(PhoneNumber number){
    phoneNumber = number.phoneNumber.toString();
    // dPrint('yes fola:::: $phoneNumber');
    notifyListeners();
  }


  Future<void> sendOtpToMobile(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 210),
            () => _navigationService.navigateTo(Routes.verifyPhoneViewRoute,  arguments: phoneNumber));
  }

  void navigateToLogin() {
    Future.delayed(const Duration(milliseconds: 210),
            () => _navigationService.replaceWith(Routes.loginViewRoute));

  }

}

