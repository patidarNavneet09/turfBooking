import 'package:flutter/material.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';

extension Number on num {
  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * (this / 100);
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * (this / 100);
  }

  Widget get verticalSizeBox {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget get horizontalSizeBox {
    return SizedBox(
      width: toDouble(),
    );
  }
}

extension InputDec on InputDecoration {
  InputDecoration passwordTxtFieldStyle({
    required bool obscured,
    Color? color,
    required VoidCallback toggleObscured,
    required String hintText,
  }) =>
      InputDecoration(
        hintStyle: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            color: MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        hintText: hintText,
        suffixIcon: InkWell(
          radius: 30,
          splashColor: Colors.grey.withOpacity(0.4),
          onTap: toggleObscured,
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: obscured
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.remove_red_eye)),
        ),
        helperStyle: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            color: MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorStyle: const TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: MyColor.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: MyColor.white,
          ),
        ),
        filled: true,
        fillColor: MyColor.white,
      );

  InputDecoration emailTxtFieldStyle() => InputDecoration(
        hintText: "Enter your Email",
        hintStyle: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            color: MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorStyle: const TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: MyColor.grey,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.grey)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.grey)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.grey)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: MyColor.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: MyColor.grey,
          ),
        ),
        filled: true,
        fillColor: MyColor.grey,
      );

  InputDecoration prefixIconTextField({
    Widget? prefix,
    Widget? suffix,
    Color? backgroundColor,
    Color? bordercolor,
    required hintText,
  }) =>
      InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            color: MyColor.tabbar,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorStyle: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: bordercolor ?? MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: bordercolor ?? const Color(0xffE3E3E3))),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: bordercolor ?? const Color(0xffE3E3E3))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: bordercolor ?? const Color(0xffE3E3E3))),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: bordercolor ?? const Color(0xffE3E3E3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: bordercolor ?? MyColor.white,
          ),
        ),
        filled: true,
        fillColor: backgroundColor ?? MyColor.white,
      );

  InputDecoration suffixIconTextField({
    required Widget suffix,
    required hintText,
  }) =>
      InputDecoration(
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            color: MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorStyle: const TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: MyColor.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: MyColor.white,
          ),
        ),
        filled: true,
        fillColor: MyColor.white,
      );

  InputDecoration defaultTextField({
    required hintText,
  }) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            color: MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorStyle: const TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.normal,
            color: MyColor.white,
            fontWeight: FontWeight.w400,
            fontFamily: ColorFamily.fontsSFProDisplay),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: MyColor.white)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: MyColor.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: MyColor.white,
          ),
        ),
        filled: true,
        fillColor: MyColor.white,
      );
}
