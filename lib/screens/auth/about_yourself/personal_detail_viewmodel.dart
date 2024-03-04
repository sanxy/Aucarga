import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';



class PersonalDetailViewModel extends ReactiveViewModel {

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool obscurePassword = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  String phoneNumber = "";
  RegExp passwordRegex = RegExp(r'^(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})[a-zA-Z0-9!@#\$%\^&\*]+$');

  Future<void> setup({bool isDeviceVerification = false}) async {

  }


}

