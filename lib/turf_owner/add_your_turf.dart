import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';
import 'package:turfbooking/profile.dart';
import 'package:turfbooking/turf_owner/owner_dashboar_screen.dart';
import 'package:turfbooking/turf_owner/set_pricing.dart';
import 'package:turfbooking/utils/mybuttons.dart';

class AddYourTurf extends StatefulWidget {
  const AddYourTurf({super.key});

  @override
  State<AddYourTurf> createState() => _AddYourTurfState();
}

class _AddYourTurfState extends State<AddYourTurf> {
  /// image picker and its variable
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
  TextEditingController emailController = TextEditingController();
  String dropdownvalue = '1 Hour';

  // List of items in our dropdown menu
  var items = [
    '1 Hour',
    '2 Hour',
    '3 Hour',
    '4 Hour',
    '5 Hour',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Setup Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'assets/font/poppins_regular.ttf',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                        border: Border.all(width: 4, color: MyColor.white),
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
                                child: Image.asset("assets/images/Demopic.png"),
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
                child: Text(
                  MyString.turfLogo.tr(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: MyColor.black,
                    fontFamily: ColorFamily.fontsPopinsDisplay,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    MyString.turfName.tr(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: MyColor.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                          // prefixIcon: const Icon(Icons.person_2_outlined),
                          // prefixIconColor: MaterialStateColor.resolveWith(
                          //     (states) =>
                          //         states.contains(MaterialState.focused)
                          //             ? MyColor.black
                          //             : Colors.grey),
                          hintText: MyString.ground1.tr(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    MyString.aboutyourturf.tr(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: MyColor.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    // height: 57,
                    child: Center(
                      child: TextFormField(
                        maxLines: 7,
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
                          // prefixIcon: const Icon(Icons.email_outlined),
                          // prefixIconColor: MaterialStateColor.resolveWith(
                          //     (states) =>
                          //         states.contains(MaterialState.focused)
                          //             ? MyColor.black
                          //             : Colors.grey),
                          hintText: MyString.typesomethingaboutyourturf.tr(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    MyString.turfLocation.tr(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: MyColor.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        // height: 57,
                        width: MediaQuery.of(context).size.width * 0.40,
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
                              // prefixIcon: const Icon(Icons.email_outlined),
                              // prefixIconColor: MaterialStateColor.resolveWith(
                              //     (states) =>
                              //         states.contains(MaterialState.focused)
                              //             ? MyColor.black
                              //             : Colors.grey),
                              // hintText: MyString.typesomethingaboutyourturf.tr(),
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),

                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: MyColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: MyColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: MyColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: MyColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      )),
                  const Text(
                    "-",
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        // height: 57,
                        width: MediaQuery.of(context).size.width * 0.40,
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
                              // prefixIcon: const Icon(Icons.email_outlined),
                              // prefixIconColor: MaterialStateColor.resolveWith(
                              //     (states) =>
                              //         states.contains(MaterialState.focused)
                              //             ? MyColor.black
                              //             : Colors.grey),
                              // hintText: MyString.typesomethingaboutyourturf.tr(),
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: ColorFamily.fontsPopinsDisplay,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),

                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: MyColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: MyColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: MyColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: MyColor.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    MyString.slotDuration.tr(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: MyColor.black,
                      fontFamily: ColorFamily.fontsPopinsDisplay,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      // icon: const Icon(Icons.keyboard_arrow_down),
                      isExpanded: true,
                      // itemHeight: 50,
                      // menuMaxHeight: 200,

                      // No underline
                      underline: Container(height: 0),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                      // After selecting the desired option, it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      dropdownStyleData: DropdownStyleData(
                        elevation: 3,
                        maxHeight: 250,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: MyColor.grey,
                        ),
                        offset: const Offset(-0, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(20),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                    ),
                  ),
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
                    // Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SetPricing()));
                  },
                  name: MyString.next.tr()),
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
