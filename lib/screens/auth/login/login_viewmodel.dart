import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';
import '../../../api/apis.dart';
import '../../../app/locator.dart';
import '../../../app/router.dart';
import '../../../core/constants/strings.dart';
import '../../../core/model/login_model.dart';
import '../../../core/services/utility_storage_service.dart';
import '../../../utils/toast_service.dart';



class LoginViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final toastService = locator<ToastService>();

  final formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool obscurePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> setup({bool isDeviceVerification = false}) async {

  }


  Future<void> signIn(BuildContext context, {bool withBiometrics = false}) async {

    try {
      isLoading = true;
      notifyListeners();


      var response = await http.post(Uri.parse(Apis.baseUrl + Apis.login), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
          body: json.encode({
            "email": emailController.text,
            "password": passwordController.text,
            'username': usernameController.text,
            'user_type': "vendor"
          })).timeout(const Duration(seconds: 60));

      // dPrint('statusCode::: ${response.statusCode}');
      dev.log('response::: ${response.body}');

      String? success = jsonDecode(response.body)['status'];
      String? message = jsonDecode(response.body)['message'];

      // dPrint('success::: ${success}');

      //success
      if (response.statusCode == 200 && success == "success") {
        LoginData? temp =  LoginData.fromJson(jsonDecode(response.body) as Map<String,dynamic>);

        isLoading = false;
        notifyListeners();

        // dPrint('login successful:::');
        // dPrint('login successful::: ${jsonDecode(response.body)}');

        StorageService().addString('email', temp.data!.email.toString());
        StorageService().addString('username', temp.data!.username.toString());

        Future.delayed(const Duration(milliseconds: 210),
                () => _navigationService.replaceWith(Routes.dashboardViewRoute));

      }
      //failure
     else {
        isLoading = false;
        notifyListeners();

        toastService.showToast(
          message: message ?? AppStrings.unknownError,
          messageType: ToastMessageType.info,
        );
        // dPrint('error ${response.body}');
      }
    } on SocketException {
      isLoading = false;
      notifyListeners();

      toastService.showToast(
        message: AppStrings.internetError,
        messageType: ToastMessageType.error,
      );

    }  catch (e) {
      isLoading = false;
      notifyListeners();

      toastService.showToast(
        message:AppStrings.unknownError,
        messageType: ToastMessageType.error,
      );

      // dPrint("Error received during login: ${e.toString()}");
    }
  }

}

