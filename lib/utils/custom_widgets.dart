import 'package:etcetera/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../widgets/animated_logo.dart';



class BuildBtn extends StatelessWidget {
  final String title;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onPressed;
  final String? prefix;
  final Color? borderColor;
  final Color? iconColor;
  final bool? showLoadingIcon;
  final bool? enabled;


  const BuildBtn(
      {super.key,
        required this.title,
        required this.onPressed,
        required this.buttonColor,
        required this.textColor,
        this.prefix,
        this.borderColor = Colors.transparent,
        this.iconColor = Colors.white,
        this.showLoadingIcon = false,
        this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: enabled! && !showLoadingIcon!
                    ? buttonColor
                    : buttonColor.withOpacity(0.5) ,
                foregroundColor: enabled! && !showLoadingIcon!
                    ? Colors.white
                    : buttonColor.withOpacity(0.1),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 17),
                shape:  RoundedRectangleBorder(
                    side: BorderSide(color: borderColor!),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)))),
            onPressed: !enabled!
                       ? (){}
                      : showLoadingIcon!
                          ? (){}
                          : onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                prefix != null
                    ? Row(
                    children: [
                      SvgPicture.asset(prefix!,color: textColor,height: 20),
                      const SizedBox(width: 10)
                    ])
                    : const SizedBox(),
                Text(title,
                    style: TextStyle(
                        color: textColor,
                        letterSpacing: 0.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700)),
                showLoadingIcon!
                    ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(color: iconColor, strokeWidth: 3)))
                    : const SizedBox()
              ],
            )),
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final bool? enabled;
  final Function(String?)? onChanged;
  final TextInputType keyBoardType;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffix;
  final int maxLines;
  final int? maxLength;
  final String? fontFamily;
  final List<TextInputFormatter>? inputFormatters;
  final Color? errorColor;
  final Widget? moreInfoIcon;

  const BuildTextField(
      {super.key,
        this.controller,
        this.onChanged,
        required this.hintText,
        required this.labelText,
        this.onTap,
        this.errorColor,
        this.validator,
        this.inputFormatters,
        this.keyBoardType = TextInputType.text,
        this.fontFamily,
        this.maxLines = 1,
        this.obscureText = false,
        this.enabled = true,
        this.suffix,
        this.moreInfoIcon,
        this.maxLength});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(labelText,
                  style: const TextStyle(
                      color:  Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(width: 3),
              moreInfoIcon != null ? moreInfoIcon! : const SizedBox()
            ],
          ),
          const SizedBox(height: 3),
          SizedBox(
            // height: 50,
            child: TextFormField(
              onTap: onTap,
              onChanged: onChanged,
              maxLines: maxLines,
              enabled: enabled,
              controller: controller,
              obscureText: obscureText,
              maxLength: maxLength,
              obscuringCharacter: '*',
              style:  TextStyle(fontSize: 16.0,fontFamily:  fontFamily ?? 'sora',color:
              errorColor ?? (Colors.black)),
              keyboardType: keyBoardType == TextInputType.number
                  ? const TextInputType.numberWithOptions(signed: false, decimal: false)
                  : keyBoardType,
              inputFormatters: inputFormatters,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
                errorStyle:  TextStyle(fontSize: 14,fontFamily:  fontFamily ?? 'sora'),
                counterText: '',
                fillColor: const Color(0xFFF1F5F9),
                hintText: hintText,
                hintStyle: const TextStyle(
                  color:  Color(0xFF94A3B8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                constraints: const BoxConstraints(maxHeight: 80,minHeight: 46),
                filled: true,
                suffixIcon:suffix,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(color: Colors.grey.withOpacity(0.2),width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(color: Colors.grey.withOpacity(0.2),width: 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(color: Colors.grey.withOpacity(0.2),width:0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(width:1, color: MyColors.bluePrimary),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(color: MyColors.bluePrimary,width: 1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(color: MyColors.informativeRed,width: 1),
                ),
              ),
              validator: validator ?? (value) {
                if (value!.isEmpty) {
                  Fluttertoast.showToast(msg: "Field cannot be empty");
                  return "Value cannot be empty";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingOverlayWidget extends StatelessWidget {
  final bool isLoading;
  final String? loadingText;
  final Widget child;

  const LoadingOverlayWidget({super.key, required this.isLoading, required this.child,this.loadingText = 'Please wait...'});


  @override
  Widget build(BuildContext context) {

    return LoadingOverlay(
      opacity: 0.4,
      color: Colors.black87,
      isLoading: isLoading,
      progressIndicator: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AnimatedLogo(),
          const SizedBox(height: 15),
          Text(
              loadingText!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontFamily: 'sora')),
          const SizedBox(height: 8),
          const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )

        ],
      ),

      child: child,
    );
  }
}

class BackBtn extends StatelessWidget {

  final String? title;
  const BackBtn({super.key, this.title});


  @override
  Widget build(BuildContext context) {

    return  Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(top: 6,bottom:6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(width: 15),
          GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/icons/back.svg',height: 24,color: const Color(0xFF1E293B))),
          const SizedBox(width: 6),
          Text(
              title ?? '',
              style: const TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              )
          )
        ],
      ),
    );
  }
}





