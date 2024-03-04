import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/router.dart';



class AccountDoneViewModel extends ReactiveViewModel {

  bool isLoading = false;

  Future<void> setup({bool isDeviceVerification = false}) async {

  }

  void navigateToStartUp(){
    NavigationService().clearStackAndShow(Routes.startupViewRoute);
  }

}

