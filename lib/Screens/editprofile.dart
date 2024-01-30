import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/utils/mybuttons.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

List<XFile> imageFileList = [];

class _ProfileSettingState extends State<ProfileSetting> {
  File? image;
  File? selectedImage1;
  dynamic image1;
  String base64Image = "";
  Future<void> chooseImage1(type) async {
    imageFileList.clear();
    // print("imageFileList${imageFileList.length}");
    if (type == "camera") {
      image1 = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);
      imageFileList.add(image1);

      // print("ggggg${imageFileList.map((e) => e.path)}");
    } else {
      image1 = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      imageFileList.add(image1);
      // print(imageFileList.length);
    }

    // print("imageFileList>>>>>>>>>${imageFileList.length}");
    if (image1 != null) {
      setState(() {
        selectedImage1 = File(image1.path);
        base64Image = base64Encode(selectedImage1!.readAsBytesSync());
        // print(imageFileList);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => ProfileGet(context));
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          "My Trips",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        // showDialog(
                        //   barrierDismissible: false,
                        //   context: context,
                        //   builder: (BuildContext context) => PopupContent(),
                        // );
                        // chooseImage1("camera");
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              // <-- SEE HERE
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0),
                              ),
                            ),
                            context: context,
                            builder: ((builder) => bottomSheet1()));
                      },
                      child: Stack(
                        children: [
                          Container(
                              margin: const EdgeInsets.all(2),
                              height: 123,
                              width: 123,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 4, color: MyColor.button),
                                shape: BoxShape.circle,
                              ),
                              child: selectedImage1 != null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 50,
                                      backgroundImage: Image.file(
                                        selectedImage1!,
                                        fit: BoxFit.cover,
                                      ).image,
                                    )
                                  : const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          "assets/images/Ellipse 18.png"))
                              // : snapshot.data!.data!.photo!.isEmpty
                              //     ? Padding(
                              //         padding:
                              //             const EdgeInsets.all(40.0),
                              //         child: SvgPicture.asset(
                              //             'assets/images/ic_upload_icon.svg'),
                              //       )
                              //     : Padding(
                              //         padding:
                              //             const EdgeInsets.all(0.0),
                              //         child: ClipOval(
                              //           child: CachedNetworkImage(
                              //             imageUrl: snapshot
                              //                 .data!.data!.photo
                              //                 .toString(),
                              //             progressIndicatorBuilder:
                              //                 (context, url,
                              //                         downloadProgress) =>
                              //                     Padding(
                              //               padding:
                              //                   const EdgeInsets.all(
                              //                       30.0),
                              //               child:
                              //                   CircularProgressIndicator(
                              //                       color: MyColor
                              //                           .black,
                              //                       value:
                              //                           downloadProgress
                              //                               .progress),
                              //             ),
                              //             errorWidget: (context, url,
                              //                     error) =>
                              //                 const Icon(Icons.error),
                              //             fit: BoxFit.cover,
                              //           ),
                              //         ),
                              //       ),
                              ),
                          Positioned(
                            left: 95,
                            top: 95,
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Stack(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                    ),
                                    Image.asset(
                                        "assets/images/editpropfile.png"),
                                  ],
                                )),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "First Name",
                style: TextStyle(
                  fontSize: 18,
                  color: MyColor.black,
                  // overflow: TextOverflow.ellipsis,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF9F8F8),
                        borderRadius: BorderRadius.circular(10)),
                    height: 57,
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        controller: nameController,

                        // controller: NameController
                        //   ..text =
                        //       snapshot.data!.data!.name.toString(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          // focusColor: MyColor.Red_color,
                          // fillColor: MyColor.Red_color,
                          // prefixIcon: const Icon(Icons.person_2_outlined),
                          // prefixIconColor: MaterialStateColor.resolveWith(
                          //     (states) =>
                          //         states.contains(MaterialState.focused)
                          //             ? MyColor.black
                          //             : Colors.grey),
                          hintText: "  James",
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.greyText),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.greyText),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Last Name",
                style: TextStyle(
                  fontSize: 18,
                  color: MyColor.black,
                  // overflow: TextOverflow.ellipsis,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F8F8),
                      borderRadius: BorderRadius.circular(10)),
                  height: 57,
                  child: Center(
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      controller: lastNameController,
                      // controller: snapshot
                      //         .data!.data!.email!.isEmpty
                      //     ? emailController
                      //     : emailController
                      //   ..text = snapshot.data!.data!.email!
                      //   ..selection = TextSelection.fromPosition(
                      //       TextPosition(
                      //           offset:
                      //               emailController.text.length)),
                      // controller: EmailController
                      //   ..text =
                      //       snapshot.data!.data!.email.toString(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // prefixIcon: const Icon(Icons.email_outlined),
                        // prefixIconColor: MaterialStateColor.resolveWith(
                        //     (states) => states.contains(MaterialState.focused)
                        //         ? MyColor.black
                        //         : Colors.grey),
                        hintText: "  Smith",
                        hintStyle: const TextStyle(
                            color: MyColor.black,
                            fontFamily: ColorFamily.fontsSFProDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.greyText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.greyText),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 18,
                  color: MyColor.black,
                  // overflow: TextOverflow.ellipsis,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF9F8F8),
                        borderRadius: BorderRadius.circular(10)),
                    height: 57,
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        controller: phonenumberController,
                        // controller: languageController
                        //   ..text = snapshot.data!.data!.language!
                        //   ..selection = TextSelection.fromPosition(
                        //       TextPosition(
                        //           offset: languageController
                        //               .text.length)),

                        // controller: NameController
                        //   ..text =
                        //       snapshot.data!.data!.name.toString(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          // focusColor: MyColor.Red_color,
                          // fillColor: MyColor.Red_color,
                          // prefixIcon: const Icon(Icons.language),
                          // prefixIconColor: MaterialStateColor.resolveWith(
                          //     (states) =>
                          //         states.contains(MaterialState.focused)
                          //             ? MyColor.black
                          //             : Colors.grey),
                          hintText: "  5645645646",
                          hintStyle: const TextStyle(
                              color: MyColor.black,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.greyText),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.greyText),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 18,
                  color: MyColor.black,
                  // overflow: TextOverflow.ellipsis,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF9F8F8),
                        borderRadius: BorderRadius.circular(10)),
                    height: 57,
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        controller: emailController,
                        // controller: languageController
                        //   ..text = snapshot.data!.data!.language!
                        //   ..selection = TextSelection.fromPosition(
                        //       TextPosition(
                        //           offset: languageController
                        //               .text.length)),

                        // controller: NameController
                        //   ..text =
                        //       snapshot.data!.data!.name.toString(),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          // focusColor: MyColor.Red_color,
                          // fillColor: MyColor.Red_color,
                          // prefixIcon: const Icon(Icons.language),
                          // prefixIconColor: MaterialStateColor.resolveWith(
                          //     (states) =>
                          //         states.contains(MaterialState.focused)
                          //             ? MyColor.black
                          //             : Colors.grey),
                          hintText: "  james@gmail.com",
                          hintStyle: const TextStyle(
                              color: MyColor.greyText,
                              fontFamily: ColorFamily.fontsSFProDisplay,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.greyText),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: MyColor.greyText),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 130,
              ),
              // Container(
              //     // margin: const EdgeInsets.fromLTRB(
              //     //     10.0, 40.0, 40.0, 10.0),
              //     width: MediaQuery.of(context).size.width * 0.80,
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => Dashboard(
              //                     page_index: 0,
              //                   )),
              //         );
              //       },
              //       style: ElevatedButton.styleFrom(
              //         primary: MyColor.Red_color,
              //         // side: BorderSide(color: Colors.yellow, width: 5),

              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10))),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.fromLTRB(00.0, 18.0, 00.0, 18.0),
              //         child: Text(
              //           'Submit',
              //           style: TextStyle(
              //             fontSize: 16,
              //             color: Colors.white,
              //             fontFamily: ColorFamily.fontsSFProDisplay,
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //       ),
              //     )),
              AppButton(
                btnWidth: MediaQuery.of(context).size.width * 0.80,
                boder1: BorderRadius.circular(50),
                boder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w700,
                ),
                name: 'Update',
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => Dashboard(
                  //             page_index: 0,
                  //           )),
                  // );

                  // String name = nameController.text;
                  // String email = emailController.text;

                  // if (name.isEmpty) {
                  //   Fluttertoast.showToast(
                  //       msg: "Please Enter Your Name");
                  // } else if (email.isEmpty) {
                  //   Fluttertoast.showToast(
                  //       msg: "Please Enter Your Email Address");
                  // } else {
                  // }
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet1() {
    return Container(
      height: 110.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
              color: MyColor.black,
              fontFamily: ColorFamily.fontsSFProDisplay,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 1.0, color: Colors.blue),
                    minimumSize: const Size(110, 35),
                    maximumSize: const Size(115, 35),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    chooseImage1("camera");
                  },
                  icon: const Icon(
                    Icons.camera,
                    color: MyColor.black,
                  ),
                  label: const Text(
                    "camera",
                    style: TextStyle(
                      fontSize: 10,
                      color: MyColor.black,
                      fontFamily: ColorFamily.fontsSFProDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                  minimumSize: const Size(110, 35),
                  maximumSize: const Size(115, 35),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  chooseImage1("Gallery");
                },
                icon: const Icon(
                  Icons.image,
                  color: MyColor.black,
                ),
                label: const Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 10,
                    color: MyColor.button,
                    fontFamily: ColorFamily.fontsSFProDisplay,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
