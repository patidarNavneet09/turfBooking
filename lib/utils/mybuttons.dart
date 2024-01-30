import 'package:flutter/material.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final OutlinedBorder? boder;
  final BorderRadiusGeometry? boder1;
  final double? textSize;
  final double? btnRadius;
  final double? btnWidth;
  final double? btnHeight;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color? color;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.name,
    this.boder,
    this.boder1,
    this.textStyle,
    this.textSize,
    this.padding,
    this.btnRadius,
    this.btnWidth,
    this.btnHeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: btnWidth ?? MediaQuery.of(context).size.width * 0.80,
          height: btnHeight,
          margin: padding,
          child: DecoratedBox(
            decoration: BoxDecoration(
              // color: MyColor.Red_color,
              // ignore: prefer_const_constructors
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: const [
                  MyColor.button1,
                  MyColor.button,
                ],
              ),
              borderRadius: boder1 ?? BorderRadius.circular(15),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color ?? MyColor.transparent,
                shadowColor: MyColor.transparent,
                shape: boder ??
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
              ),
              onPressed: onPressed,
              child: Padding(
                padding: padding ??
                    const EdgeInsets.fromLTRB(00.0, 18.0, 00.0, 18.0),
                child: Text(
                  name,
                  style: textStyle ??
                      const TextStyle(
                        fontSize: 16,
                        color: MyColor.white,
                        // fontFamily: "assets/fonts/Raleway-SemiBold.ttf",
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
