import 'package:etcetera/screens/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import '../../utils/my_colors.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ViewModelBuilder<DashboardViewModel>.reactive(
        onViewModelReady: (model) => model.setup(),
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: MyColors.backgroundColor,
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Container(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'user profile',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: MyColors.darkBackgroundColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'email: ${model.email}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: MyColors.darkBackgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'username: ${model.username}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: MyColors.darkBackgroundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        });
  }


}
