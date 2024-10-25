import 'package:etcetera/screens/auth/phone/phone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/my_colors.dart';



class PhoneView extends StatelessWidget {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ViewModelBuilder<PhoneViewModel>.reactive(
        onViewModelReady: (model) => model.setup(),
        viewModelBuilder: () => PhoneViewModel(),
        builder: (context, model, child) {
          return LoadingOverlayWidget(
            isLoading: model.isLoading,
            child: Scaffold(
              backgroundColor: MyColors.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                      child: Form(
                        key: model.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            const BackBtn(title: 'Step 1/3'),
                            const SizedBox(height: 20),
                            Text(
                              'Sign up to Aucarga',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Text(
                              'We’ll send a code to verify & create your account.',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            const SizedBox(height: 30),
                            Text(
                              'Phone Number',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                model.getPhoneNumber(number);
                              },
                              onInputValidated: (bool value) {
                                // print(value);
                              },
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                useBottomSheetSafeArea: true,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: const TextStyle(color: Colors.black),
                              initialValue: model.number,
                              textFieldController: model.controller,
                              formatInput: true,
                              keyboardType:
                              const TextInputType.numberWithOptions(signed: true, decimal: true),
                              inputBorder: const OutlineInputBorder(),
                              onSaved: (PhoneNumber number) {
                                // print('On Saved: $number');
                              },
                            ),


                            const SizedBox(height: 70),
                            BuildBtn(
                                enabled: model.controller.text.isNotEmpty &&
                                    model.controller.text != '',
                                title: 'Continue',
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  model.formKey.currentState?.save();
                                  // if (model.formKey.currentState!.validate()) {
                                    model.sendOtpToMobile(context);
                                  // }
                                },
                                buttonColor: MyColors.bluePrimary,
                                textColor: Colors.white),

                            const SizedBox(height: 20),

                            GestureDetector(
                              onTap: (){
                                model.navigateToLogin();
                              },
                              child: Center(
                                child: Text(
                                  'Already have an account? Log in',
                                  style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }


}
