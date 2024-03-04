import 'package:stacked/stacked.dart';
import '../../app/locator.dart';
import '../../core/services/utility_storage_service.dart';

class DashboardViewModel extends ReactiveViewModel {
  final StorageService _storageService = locator<StorageService>();

  String? email = "";
  String? username = "";



  Future<void> setup() async {
    if (_storageService.getString('email') != null && _storageService.getString('username') != null) {
      email = _storageService.getString('email')!;
      username = _storageService.getString('username')!;
      notifyListeners();
    }

  }


}

