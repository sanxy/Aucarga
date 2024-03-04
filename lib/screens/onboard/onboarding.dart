import 'package:etcetera/screens/onboard/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../utils/my_colors.dart';


class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
   final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<OnboardingViewModel>.reactive(
        onModelReady: (model) => model.setup(),
        viewModelBuilder: () => OnboardingViewModel(),
        builder: (context, model, child) => Material(
                child: Scaffold(
              backgroundColor: MyColors.backgroundColor,
              body: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Indicator
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        model.headers.length,
                            (index) => GestureDetector(
                          onTap: () {
                            model.pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            width: 30.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: index <= model.currentIndex ? MyColors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Header Text
                    Text(
                      model.headers[ model.currentIndex],
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    // Body Text
                    Text(
                      model.bodies[ model.currentIndex],
                      style: TextStyle(fontSize: 18.0),
                      textAlign: TextAlign.center,
                    ),
                    // Image
                    Expanded(
                      child: PageView.builder(
                        controller:  model.pageController,
                        itemCount:  model.headers.length,
                        onPageChanged: (index) {
                          model.changePage(index);
                        },
                        itemBuilder: (context, index) {
                          return Center(
                            child: Image.asset(
                              model.images[index],
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                    ),
                    // Skip Text
                    Center(
                      child: TextButton(
                        onPressed: () {
                          model.navigateToStartUp();
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(fontSize: 18.0, color: MyColors.black),
                        ),
                      ),
                    ),

                    SizedBox(height: 100,),
                  ],
                ),
              ),
            )));
  }
}
