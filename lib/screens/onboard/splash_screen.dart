import 'package:etcetera/screens/onboard/splash_screen_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../utils/my_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        onViewModelReady: (model) => model.setup(),
        viewModelBuilder: () => SplashScreenViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: MyColors.bluePrimary,
              body: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'assets/logos/logo.svg',
                      height: 78,
                      width: 78,
                    ),
                  ),
                ],
              ));
        });
  }
}
