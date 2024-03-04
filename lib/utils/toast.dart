import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import '../core/enums/toast_mesage.dart';
import 'my_colors.dart';



Future<dynamic> showToast({required String message, required ToastMessageType messageType, required BuildContext context}) async {
  return context.showFlash<bool>(
      barrierColor: Colors.black12,
      barrierDismissible: true,
      duration: const Duration(milliseconds: 4000),
      builder: (context, controller) {

        return FlashBar(
          backgroundColor: MyColors.darkCardBackgroundColor ,
          position: FlashPosition.top,
          controller: controller,
          elevation: 0,
          iconColor: messageType == ToastMessageType.success
              ? Colors.green
              : messageType == ToastMessageType.info
              ? Colors.blue
              : Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(4),
            ),
            side: BorderSide(
              color: MyColors.darkBackgroundColor ,
              width: 0.5,
            ),
          ),
          indicatorColor: messageType == ToastMessageType.success
              ? Colors.green
              : messageType == ToastMessageType.info
              ? Colors.blue
              : Colors.red,
          icon: Icon(
            messageType == ToastMessageType.success
                ? Icons.check
                : messageType == ToastMessageType.info
                ? Icons.info_outline
                : Icons.error_outline,
          ),
          title: Text(
            messageType == ToastMessageType.success
                ? 'Success'
                : messageType == ToastMessageType.info
                ? 'Info'
                : 'Failed',
            style:
            TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: messageType == ToastMessageType.success
                ? Colors.green
                : messageType == ToastMessageType.info
                ? Colors.blue
                : Colors.red),
          ),
          content: Text(
            message,
            style:
            TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color:  Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => controller.dismiss(true),
              child: Text(
                'Okay',
                style: TextStyle(color: Colors.white ,fontSize: 14),
              ),
            ),
          ],
        );
      });
}

