import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/home_screen.dart';
import 'package:turfbooking/utils/mybuttons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
    return Colors.green;
  }

  TextEditingController textEditingController = TextEditingController();
  dynamic comp;
  dynamic comp1;

  Telephony telephony = Telephony.instance;
  @override
  void initState() {
    starttimer();
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        debugPrint(message.address);
        debugPrint(message.body);

        String sms = message.body.toString();
        debugPrint("sms>>>>>>>>>>>$sms");
        if (message.body!.contains('Your OTP for logging in to Stayezy is')) {
          textEditingController.text = sms.replaceAll(RegExp(r'[^0-9]'), '');
          textEditingController.text.split("");
          debugPrint("sms>>>>>>>>>>>$textEditingController");
          setState(() {
            // refresh UI
          });
        } else {
          debugPrint("error");
        }
      },
      listenInBackground: false,
    );
    super.initState();

    // textEditingController = TextEditingController();
    // initSmsListener();
  }

  int secondsRemaining = 20;
  dynamic countTime = 0;
  bool enableResend = false;
  late Timer timer;
  void starttimer() {
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
          timer.cancel();
        });
      }
    });
  }

  void _resendCode() {
    setState(() {
      secondsRemaining = 20;
      enableResend = false;
      timer.cancel();
      starttimer();
    });
  }

  @override
  void dispose() {
    // textEditingController.dispose();
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/image 2.png"),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  MyString.enterOTP.tr(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'assets/font/poppins_regular.ttf',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  MyString.entertheverificationcodesendtoyourmobilenumber.tr(),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'assets/font/poppins_regular.ttf',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: formKey,
                      child: SizedBox(
                        width: screenSize.size.width * 0.90,
                        // width: 300,
                        child: PinCodeTextField(
                          cursorColor: Colors.black,
                          cursorHeight: 17,
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Quicksand"),
                          autoFocus: false,
                          appContext: context,
                          length: 6,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            borderRadius: BorderRadius.circular(6),
                            fieldHeight: 56,
                            fieldWidth: 30,
                            inactiveColor: Colors.black,
                            disabledColor: Colors.transparent,
                            activeFillColor: Colors.transparent,
                            activeColor: Colors.black,
                            selectedColor: Colors.black,
                            inactiveFillColor: Colors.transparent,
                            selectedFillColor: Colors.transparent,
                          ),
                          animationDuration: const Duration(milliseconds: 500),
                          enableActiveFill: true,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          onCompleted: (pin) {
                            setState(() {
                              comp1 = pin;
                            });
                          },
                          onChanged: (pin2) {
                            setState(() {});
                            setState(() {
                              comp = pin2.length;
                            });
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      countTime = 20;
                      setState(() {});
                      // enableResend == true ? loginResendApi() : null;
                      enableResend == true ? _resendCode() : null;
                    },
                    child: Text(
                      secondsRemaining.toString() == "0"
                          ? MyString.resend.tr()
                          : "${MyString.resendin.tr()} ${secondsRemaining.toString()}s",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'assets/font/poppins_regular.ttf',
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
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
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              content: Builder(builder: (context) {
                                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                var height = MediaQuery.of(context);
                                var width = MediaQuery.of(context).size.width;

                                return SizedBox(
                                  height: height.size.height * 0.23,
                                  width: width * 0.60,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/right_icon.png",
                                        height: height.size.height * 0.15,
                                        width: width * 0.30,
                                      ),
                                      SizedBox(
                                        height: height.size.height * 0.02,
                                      ),
                                      Text(
                                        MyString.mobilenumberisverified.tr(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: MyColor.black,
                                          fontFamily:
                                              ColorFamily.fontsPopinsDisplay,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })));
                      Future.delayed(const Duration(seconds: 3), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      });
                    },
                    name: MyString.verify.tr()),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  MyString.changeNumber.tr(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'assets/font/poppins_regular.ttf',
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
    );
  }
}
