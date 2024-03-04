import 'package:etcetera/screens/auth/about_yourself/personal_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/router.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/my_colors.dart';



class PersonalDetail extends StatelessWidget {
  const PersonalDetail({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ViewModelBuilder<PersonalDetailViewModel>.reactive(
        onViewModelReady: (model) => model.setup(),
        viewModelBuilder: () => PersonalDetailViewModel(),
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
                            const BackBtn(title: 'Step 3/3'),
                            const SizedBox(height: 20),
                            Text(
                              'Tell us about yourself',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 10),
                            Text(
                              'Please enter your legal names exactly as they appear on your identity card',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            const SizedBox(height: 30),
                            BuildTextField(
                              onChanged: (val) {
                                model.notifyListeners();
                              },
                              validator: (inputValue) {
                                if (inputValue == null || inputValue.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              labelText: "First name",
                              hintText: "",
                              controller: model.firstNameController,
                            ),
                            const SizedBox(height: 10),
                            BuildTextField(
                              onChanged: (val) {
                                model.notifyListeners();
                              },
                              validator: (inputValue) {
                                if (inputValue == null || inputValue.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              labelText: "Last name",
                              hintText: "",
                              controller: model.lastNameController,
                            ),
                            const SizedBox(height: 10),
                            BuildTextField(
                              onChanged: (val) {
                                model.notifyListeners();
                              },
                              validator: (inputValue) {
                                if (inputValue == null || inputValue.isEmpty) {
                                  return 'Field is required';
                                }
                                if (!model.emailRegex.hasMatch(inputValue.trim())) {
                                  return 'Incorrect email format';
                                }
                                return null;
                              },
                              labelText: "Email",
                              hintText: "",
                              controller: model.emailController,
                            ),
                            const SizedBox(height: 10),
                            BuildTextField(
                              onChanged: (val) {
                                model.notifyListeners();
                              },
                              obscureText: model.obscurePassword,
                              suffix: SizedBox(
                                width: 60,
                                child: GestureDetector(
                                  onTap: () {
                                    model.obscurePassword = !model.obscurePassword;
                                    model.notifyListeners();
                                  },
                                  child: Icon(
                                      model.obscurePassword
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Colors.black,
                                      size: 14),
                                ),
                              ),
                              validator: (inputValue) {
                                if (inputValue == null || inputValue.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              labelText: "Password",
                              hintText: "",
                              controller: model.passwordController,
                            ),

                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                'Your password must be at least 8 characters long and include 1 symbol and 1 number.',
                                style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            const SizedBox(height: 70),
                            BuildBtn(
                                enabled: model.passwordController.text.isNotEmpty &&
                                    model.passwordController.text != '' &&
                                    model.firstNameController.text.isNotEmpty &&
                                    model.firstNameController.text != '' &&
                                    model.lastNameController.text.isNotEmpty &&
                                    model.lastNameController.text != '' &&
                                    model.emailController.text.isNotEmpty &&
                                    model.emailController.text != '' &&
                                    model.passwordRegex.hasMatch(model.passwordController.text) &&
                                model.emailRegex.hasMatch(model.emailController.text),
                                title: 'Create your account',
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  model.formKey.currentState?.save();
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BottomSheetContent();
                                    },
                                  );
                                  // }
                                },
                                buttonColor: MyColors.bluePrimary,
                                textColor: Colors.white),

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


class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Accept Aucarga’s Terms & \n Review Privacy Notice",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/icons/close.svg',height: 20,color: const Color(0xFF1E293B))),
            ],
          ),
          const SizedBox(height: 16.0),
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(3.0),
            child: RichText(
              text: TextSpan(
                text: "By selecting “I Agree” below,  I have reviewed and agree to the ",
                style: TextStyle(color: MyColors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,),
                children: [
                  TextSpan(
                    text: 'Terms of Use',
                    style: TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: ' and acknowledge the ',
                    style: TextStyle(
                      color: MyColors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Notice.',
                    style: TextStyle(
                      color: MyColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16.0),
          Row(
            children: [
              Checkbox(
                value: _agree,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _agree = value!;
                  });
                },
              ),
              const Text("I Agree"),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
              onPressed: _agree
                  ? () {
                NavigationService().clearStackAndShow(Routes.accountDoneViewRoute);
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.bluePrimary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Set corner radius to 0
                ),
              ),
              child: Text("Continue", style: TextStyle(
                color: MyColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
