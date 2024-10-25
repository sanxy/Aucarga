import 'package:etcetera/screens/start/start_up_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/my_colors.dart';


class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<StartUpScreenViewModel>.reactive(
        onViewModelReady: (model) => model.setup(),
        viewModelBuilder: () => StartUpScreenViewModel(),
        builder: (context, model, child) => Material(
            child: Scaffold(
              backgroundColor: MyColors.backgroundColor,
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Indicator
                      const SizedBox(height: 100,),

                      Center(
                        child: SvgPicture.asset(
                          'assets/icons/logo_start.svg',
                          height: 50,
                          width: 50,
                        ),
                      ),

                      const SizedBox(height: 200,),

                      Center(
                        child: Image.asset(
                          'assets/icons/car.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 100,),


                      card(
                          icon: 'assets/icons/apple.png',
                          title: "Continue with Apple",
                          onTap: (){
                          },
                          context: context,
                      ),

                      const SizedBox(height: 10,),


                      card(
                        icon: 'assets/icons/google.png',
                        title: "Continue with Google",
                        onTap: (){
                        },
                        context: context,
                      ),

                      const SizedBox(height: 10,),

                      Center(
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: MyColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      BuildBtn(
                          title: 'Get Started',
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            model.navigateToGetStarted();

                          },
                          buttonColor: MyColors.bluePrimary,
                          textColor: Colors.white),

                      const SizedBox(height: 10,),

                      GestureDetector(
                        onTap: (){
                          model.navigateToLogin();
                        },
                        child: Center(
                          child: Text(
                            'Already have an account? Log in',
                            style: TextStyle(
                              color: MyColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 100,),
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget card({required String icon, required String title,required Function() onTap,required BuildContext context}){

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color:  MyColors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset(
                      icon,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 5.0,),
                    Text(
                      title,
                      style: TextStyle(
                          color:  MyColors.darkBackgroundColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}