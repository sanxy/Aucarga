import 'package:stacked_services/stacked_services.dart';
import '../app/locator.dart';
import '../core/enums/snack_bar_type.dart';

enum ToastMessageType { success, info, error }

class ToastService {
  final _snackbarService = locator<SnackbarService>();

  Future<void> showToast({
    required String message,
    required ToastMessageType messageType,
  }) async {
    SnackBarType variant;

    switch (messageType) {
      case ToastMessageType.success:
        variant = SnackBarType.success;
        break;
      case ToastMessageType.info:
        variant = SnackBarType.info;
        break;
      case ToastMessageType.error:
        variant = SnackBarType.error;
        break;
    }

    _snackbarService.showCustomSnackBar(
      variant: variant,
      message: message,
    );
  }
}
