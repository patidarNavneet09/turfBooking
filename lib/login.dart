import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/constants/utility.dart';
import 'package:turfbooking/otp_screen.dart';
import 'package:turfbooking/utils/mybuttons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController numberController = TextEditingController();
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return isChecked == false ? Colors.white : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/image 2.png"),
                const SizedBox(
                  height: 65,
                ),
                Text(
                  MyString.phoneNumber.tr(),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CountryCodePicker(
                          showFlag: true,
                          onChanged: (e) {
                            // countrycode = e.dialCode.toString();
                          },
                          initialSelection: MyString.iN.tr(),
                          favorite: const ['+91', 'IN'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        // Container(
                        //   margin: const EdgeInsets.fromLTRB(0, 9, 0, 9),
                        //   height: 39,
                        //   width: 1,
                        //   color: Colors.black,
                        // ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.fromLTRB(12, 5, 0, 0),
                            child: TextField(
                              // textInputAction: TextInputAction.next,
                              onEditingComplete: () {
                                // String input = phoneController.text;
                                // if (input.isNotEmpty && input.length == 10) {
                                //   loginApi(context, input, countrycode, devicetype,
                                //       devicetoken);
                                // }
                              },
                              maxLength: 10,
                              buildCounter: (BuildContext context,
                                      {required int currentLength,
                                      int? maxLength,
                                      required bool isFocused}) =>
                                  null,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp("[0-9]")),
                              ],
                              controller: numberController,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'assets/font/poppins_regular.ttf',
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                // hintText: "Phone Number",

                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff525252),
                                  // fontFamily: ApiServer.fontsMontserrat,
                                ),
                                counter: Offstage(),
                                isDense: true,
                                // this will remove the default content padding
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                              ),
                              maxLines: 1,
                              cursorColor: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Theme(
                          data: ThemeData(
                            checkboxTheme: const CheckboxThemeData(
                              side: BorderSide(
                                  color: Colors
                                      .green), // Set border color to green
                            ),
                          ),
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          )),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(TextSpan(
                                text: MyString.bycontinuingyouagreetoour.tr(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  // fontFamily: ApiServer.fontsMontserrat,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: MyString.termsofservice.tr(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => debugPrint('Tap Here onTap'),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.green,
                                      // fontFamily: ApiServer.fontsMontserrat,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ])),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              MyString.and.tr(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                // fontFamily: ApiServer.fontsMontserrat,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text.rich(TextSpan(
                              text: MyString.privacyPolicy.tr(),
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () => print('Tap Here onTap'),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.green,
                                // fontFamily: ApiServer.fontsMontserrat,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AppButton(
                    // isLoading: isLoading,
                    // color: MyColor.transparent,
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.green,
                        Colors.green,
                      ],
                    ),
                    textStyle: const TextStyle(
                      color: MyColor.white,
                      fontSize: 16,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      fontWeight: FontWeight.w600,
                    ),
                    btnWidth: MediaQuery.of(context).size.width * 0.65,
                    onPressed: () {
                      if (isChecked == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Otpscreen()));
                      } else {
                        Utility.getToast(
                            msg: MyString.pleaseselecttermconditions,
                            toastColor: Colors.blue);
                      }
                    },
                    name: "Submit"),
              ]),
        ),
      ),
    );
  }
}
