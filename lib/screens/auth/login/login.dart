import 'package:etcetera/screens/auth/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/my_colors.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ViewModelBuilder<LoginViewModel>.reactive(
        onViewModelReady: (model) => model.setup(),
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) {
          return LoadingOverlayWidget(
            isLoading: model.isLoading,
            child: Scaffold(
              backgroundColor: MyColors.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.32,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Container(
                        decoration: BoxDecoration(
                            color: MyColors.transparent,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 50),
                             Text(
                              'LOGIN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
                      child: Form(
                        key: model.formKey,
                        child: Column(
                          children: [
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
                              validator: (inputValue) {
                                if (inputValue == null || inputValue.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                              labelText: "Username",
                              hintText: "",
                              controller: model.usernameController,
                            ),
                            const SizedBox(height: 10),
                            BuildTextField(
                              onChanged: (val) {
                                model.notifyListeners();
                              },
                              obscureText: model.obscurePassword,
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

                            const SizedBox(height: 40),
                            BuildBtn(
                                enabled: model.emailController.text.isNotEmpty &&
                                    model.emailController.text != '' &&
                                    model.passwordController.text.isNotEmpty &&
                                    model.passwordController.text != '' &&
                                    model.usernameController.text.isNotEmpty &&
                                    model.usernameController.text != '',
                                title: 'Login',
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (model.formKey.currentState!.validate()) {
                                    model.signIn(context);
                                  }
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
