import 'package:etcetera/screens/auth/account_done/account_done_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/my_colors.dart';

class AccountDoneView extends StatelessWidget {
  const AccountDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ViewModelBuilder<AccountDoneViewModel>.reactive(
        onViewModelReady: (model) => model.setup(),
        viewModelBuilder: () => AccountDoneViewModel(),
        builder: (context, model, child) {
          return LoadingOverlayWidget(
            isLoading: model.isLoading,
            child: Scaffold(
              backgroundColor: MyColors.backgroundColor,
              body: Stack(
                children: [
                  // Centered View
                  Center(
                    child: SizedBox(

                      height: 300,
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/verified_tick.svg',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Account Successfully',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              'Created',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyColors.darkBackgroundColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom View
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: BuildBtn(
                        enabled: true,
                        title: 'Done',
                        onPressed: () {
                          model.navigateToStartUp();
                        },
                        buttonColor: MyColors.bluePrimary,
                        textColor: Colors.white),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
