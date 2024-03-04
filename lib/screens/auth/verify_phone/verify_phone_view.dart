import 'package:etcetera/screens/auth/verify_phone/verify_phone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/my_colors.dart';



class VerifyPhoneView extends StatelessWidget {
  String phone;

  VerifyPhoneView({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ViewModelBuilder<VerifyPhoneViewModel>.reactive(
        onViewModelReady: (model) => model.setup(),
        viewModelBuilder: () => VerifyPhoneViewModel(),
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
                            const BackBtn(title: 'Step 2/3'),
                            const SizedBox(height: 20),
                            Text(
                              'verify your account',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Text(
                              'Please enter the code sent to ${phone}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            const SizedBox(height: 30),

                            Center(
                              child: Pinput(
                                useNativeKeyboard: true,
                                length: 5,
                                obscuringCharacter: '*',
                                showCursor: true,
                                defaultPinTheme: PinTheme(
                                  width: 65,
                                  height: 60,
                                  textStyle:  TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w700),
                                  decoration: BoxDecoration(
                                      color:  const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Colors.grey.withOpacity(0.3),width: 1)
                                  ),
                                ),
                                submittedPinTheme: PinTheme(
                                  width: 65,
                                  height: 60,
                                  textStyle:  TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w700),
                                  decoration: BoxDecoration(
                                      color:  MyColors.bluePrimary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Colors.grey.withOpacity(0.3),width: 1)
                                  ),
                                ),
                                focusedPinTheme: PinTheme(
                                  width: 65,
                                  height: 60,
                                  textStyle:  TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w700),
                                  decoration: BoxDecoration(
                                      color: MyColors.bluePrimary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color:MyColors.bluePrimary,width: 1)
                                  ),
                                ),
                                controller: model.otpController,
                                //obscureText: true,
                                onCompleted: (val) {
                                  model.verifyOtp(context);
                                  FocusScope.of(context).unfocus();
                                  model.notifyListeners();
                                },
                              ),
                            ),

                            const SizedBox(height: 100),
                            BuildBtn(
                                enabled: model.otpController.text.isNotEmpty &&
                                    model.otpController.text != '' && model.otpController.text.length == 5,
                                title: 'Continue',
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (model.formKey.currentState!.validate()) {
                                    model.verifyOtp(context);
                                  }
                                },
                                buttonColor: MyColors.bluePrimary,
                                textColor: Colors.white),

                            const SizedBox(height: 20),

                            GestureDetector(
                              onTap: () async {
                                if (!model.isResendCodeEnable) {
                                  Fluttertoast.showToast(
                                      msg: "Please retry when the countdown is done",
                                      backgroundColor: Colors.red);
                                } else {
                                  // await model.sendOtp(context);
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: ShapeDecoration(
                                      color:  const Color(0xFFF1F5F9),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Resend Code in',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(width: 2),
                                        Countdown(
                                          seconds: 120,
                                          build: (BuildContext context, double time) => Text(
                                            "${time.toInt()}s",
                                            style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                                          ),
                                          interval: const Duration(seconds: 1),
                                          controller: model.countdownController,
                                          onFinished: () {
                                            // model.enableResendCode(true);
                                          },
                                        ),
                                        const SizedBox(width: 5),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.withOpacity(0.1),
                                          ),
                                          child: Icon(
                                            Icons.refresh_sharp,
                                            color: MyColors.orangePrimary,
                                            size: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

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
