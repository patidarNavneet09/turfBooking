import 'package:flutter/material.dart';
import 'package:truckmanagement/Screens/dashboardscreen.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
import 'package:truckmanagement/utils/textfields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool texthide = true;
dynamic iconsdata;

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    iconsdata = 1;

    texthide = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          "Login",
          style: TextStyle(
            fontSize: 16,
            color: MyColor.appbartext,
            // overflow: TextOverflow.ellipsis,
            fontFamily: ColorFamily.fontsSFProDisplay,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                elevation: 1,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  // controller: passwordphoneController,
                  keyboardType: TextInputType.text,
                  obscureText: texthide,
                  decoration: const InputDecoration().prefixIconTextField(
                      suffix: InkWell(
                        onTap: () {
                          if (texthide == true) {
                            iconsdata = 0;
                            texthide = false;
                            setState(() {});
                          } else if (texthide == false) {
                            iconsdata = 1;
                            texthide = true;
                            setState(() {});
                          }
                        },
                        child: iconsdata == 0
                            ? SizedBox(
                                width: 2,
                                height: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/img_eye.png"),
                                ))
                            : SizedBox(
                                width: 2,
                                height: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/img_eye.png"),
                                )),
                      ),
                      hintText: "Email"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                elevation: 1,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  // controller: passwordphoneController,
                  keyboardType: TextInputType.text,
                  obscureText: texthide,
                  decoration: const InputDecoration().prefixIconTextField(
                      suffix: InkWell(
                        onTap: () {
                          if (texthide == true) {
                            iconsdata = 0;
                            texthide = false;
                            setState(() {});
                          } else if (texthide == false) {
                            iconsdata = 1;
                            texthide = true;
                            setState(() {});
                          }
                        },
                        child: iconsdata == 0
                            ? SizedBox(
                                width: 2,
                                height: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/img_eye.png"),
                                ))
                            : SizedBox(
                                width: 2,
                                height: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/img_eye.png"),
                                )),
                      ),
                      hintText: "Password"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                      // color: MyColor.transparent,
                      textStyle: const TextStyle(
                        color: MyColor.white,
                        fontSize: 16,
                        fontFamily: ColorFamily.fontsSFProDisplay,
                        fontWeight: FontWeight.w600,
                      ),
                      btnWidth: MediaQuery.of(context).size.width * 0.90,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashBoardscreen(
                                      pagesProviderIndex: 0,
                                    )));
                      },
                      name: "Login"),
                ],
              ),
            )
          ]),
        ),
      ),

      // bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text("dfsgsdfsdf"),
    );
  }
}
