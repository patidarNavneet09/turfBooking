import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/utils/mybuttons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

List<XFile> imageFileList = [];
bool gender = false;
int indexgender = 0;

class _ProfileState extends State<Profile> {
  dynamic image1;
  String base64Image = "";
  File? selectedImage1;
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

// all text field controller to set value on textEditing
  TextEditingController nameController = TextEditingController();
  TextEditingController typrsomthingController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController reffercodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          MyString.setupProfile.tr(),
          style: const TextStyle(
            fontSize: 18,
            color: MyColor.black,
            fontFamily: ColorFamily.fontsPopinsDisplay,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(children: [
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
                    // showModalBottomSheet(
                    //     shape: const RoundedRectangleBorder(
                    //       // <-- SEE HERE
                    //       borderRadius: BorderRadius.vertical(
                    //         top: Radius.circular(20.0),
                    //       ),
                    //     ),
                    //     context: context,
                    //     builder: ((builder) => bottomSheet1()));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 123,
                    width: 123,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: MyColor.green),
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
                        : Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ClipOval(
                              child: Image.asset("assets/images/Ellipse 1.png"),
                              // child: CachedNetworkImage(
                              //   imageUrl: "",
                              //   progressIndicatorBuilder:
                              //       (context, url, downloadProgress) => Padding(
                              //     padding: const EdgeInsets.all(20.0),
                              //     child: SizedBox(
                              //       width: MediaQuery.of(context).size.width * 0.08,
                              //       child: CircularProgressIndicator(
                              //           color: MyColor.button,
                              //           value: downloadProgress.progress),
                              //     ),
                              //   ),
                              //   errorWidget: (context, url, error) =>
                              //       const Icon(Icons.error),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                    // : const CircleAvatar(
                    //     backgroundColor: Colors.white,
                    //     radius: 50,
                    //     backgroundImage: AssetImage(
                    //         "assets/images/Ellipse 18.png"))
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
                  // Positioned(
                  //   left: 95,
                  //   top: 95,
                  //   child: SizedBox(
                  //       height: 20,
                  //       width: 20,
                  //       child: Stack(
                  //         children: [
                  //           Container(
                  //             color: Colors.white,
                  //           ),
                  //           Image.asset(
                  //               "assets/images/editpropfile.png"),
                  //         ],
                  //       )),
                  // ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
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
              child: const Text(
                MyString.changeProfileImage,
                style: TextStyle(
                  fontSize: 12,
                  color: MyColor.green,
                  fontFamily: ColorFamily.fontsPopinsDisplay,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 57,
                  child: Center(
                    child: TextFormField(
                      // readOnly: true,
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
                        prefixIcon: const Icon(Icons.person_2_outlined),
                        // prefixIconColor: MaterialStateColor.resolveWith(
                        //     (states) =>
                        //         states.contains(MaterialState.focused)
                        //             ? MyColor.black
                        //             : Colors.grey),
                        hintText: MyString.username.tr(),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: ColorFamily.fontsPopinsDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 57,
                  child: Center(
                    child: TextFormField(
                      // readOnly: true,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      controller: typrsomthingController,

                      // controller: NameController
                      //   ..text =
                      //       snapshot.data!.data!.name.toString(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // focusColor: MyColor.Red_color,
                        // fillColor: MyColor.Red_color,
                        prefixIcon: SizedBox(
                            width: 1,
                            height: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.asset("assets/images/somthing.png"),
                            )),
                        // prefixIconColor: MaterialStateColor.resolveWith(
                        //     (states) =>
                        //         states.contains(MaterialState.focused)
                        //             ? MyColor.black
                        //             : Colors.grey),
                        hintText: MyString.typesomethingaboutyou.tr(),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: ColorFamily.fontsPopinsDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 57,
                  child: Center(
                    child: TextFormField(
                      // readOnly: true,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      controller: emailController,

                      // controller: NameController
                      //   ..text =
                      //       snapshot.data!.data!.name.toString(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // focusColor: MyColor.Red_color,
                        // fillColor: MyColor.Red_color,
                        prefixIcon: const Icon(Icons.email_outlined),
                        // prefixIconColor: MaterialStateColor.resolveWith(
                        //     (states) =>
                        //         states.contains(MaterialState.focused)
                        //             ? MyColor.black
                        //             : Colors.grey),
                        hintText: MyString.yourEmailId.tr(),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: ColorFamily.fontsPopinsDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 57,
                  child: Center(
                    child: TextFormField(
                      // readOnly: true,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      controller: birthdayController,

                      // controller: NameController
                      //   ..text =
                      //       snapshot.data!.data!.name.toString(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // focusColor: MyColor.Red_color,
                        // fillColor: MyColor.Red_color,
                        prefixIcon: const Icon(Icons.calendar_month_outlined),
                        // prefixIconColor: MaterialStateColor.resolveWith(
                        //     (states) =>
                        //         states.contains(MaterialState.focused)
                        //             ? MyColor.black
                        //             : Colors.grey),
                        hintText: MyString.enterYourBirthday.tr(),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: ColorFamily.fontsPopinsDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 57,
                  child: Center(
                    child: TextFormField(
                      // readOnly: true,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      controller: reffercodeController,

                      // controller: NameController
                      //   ..text =
                      //       snapshot.data!.data!.name.toString(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // focusColor: MyColor.Red_color,
                        // fillColor: MyColor.Red_color,
                        prefixIcon: SizedBox(
                            width: 1,
                            height: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.asset("assets/images/gift.png"),
                            )),
                        // prefixIconColor: MaterialStateColor.resolveWith(
                        //     (states) =>
                        //         states.contains(MaterialState.focused)
                        //             ? MyColor.black
                        //             : Colors.grey),
                        hintText: MyString.referralCodeOptional.tr(),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: ColorFamily.fontsPopinsDisplay,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: MyColor.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/img_gender.png")),
                  InkWell(
                    onTap: () {
                      setState(() {
                        gender = true;
                        indexgender = 0;
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: indexgender == 0 ? Colors.green : MyColor.grey,
                        ),
                        color: indexgender == 0 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        MyString.male.tr(),
                        style: TextStyle(
                          fontSize: 15,
                          color: indexgender == 0 ? Colors.white : Colors.grey,
                          fontFamily: ColorFamily.fontsPopinsDisplay,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        gender = true;
                        indexgender = 1;
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: indexgender == 1 ? Colors.green : MyColor.grey,
                        ),
                        color: indexgender == 1 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        MyString.female.tr(),
                        style: TextStyle(
                          fontSize: 15,
                          color: indexgender == 1 ? Colors.white : Colors.grey,
                          fontFamily: ColorFamily.fontsPopinsDisplay,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        gender = true;
                        indexgender = 2;
                      });
                    },
                    child: Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: indexgender == 2 ? Colors.green : MyColor.grey,
                        ),
                        color: indexgender == 2 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        MyString.other.tr(),
                        style: TextStyle(
                          fontSize: 15,
                          color: indexgender == 2 ? Colors.white : Colors.grey,
                          fontFamily: ColorFamily.fontsPopinsDisplay,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
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
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomeScreen()));
                },
                name: MyString.submit.tr()),
            const SizedBox(
              height: 30,
            ),
          ]),
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
          Text(
            MyString.chooseProfilePhoto.tr(),
            style: const TextStyle(
              fontSize: 20,
              color: MyColor.black,
              fontFamily: ColorFamily.fontsPopinsDisplay,
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
                  label: Text(
                    MyString.camera.tr(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: MyColor.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
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
                label: Text(
                  MyString.gallery.tr(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: MyColor.button,
                    fontFamily: ColorFamily.fontsPopinsDisplay,
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
