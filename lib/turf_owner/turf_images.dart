import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turfbooking/constants/AppColor/app_colors.dart';
import 'package:turfbooking/constants/AppColor/app_fontfamily.dart';
import 'package:turfbooking/constants/string_file.dart';

class TurfImages extends StatefulWidget {
  const TurfImages({super.key});

  @override
  State<TurfImages> createState() => _TurfImagesState();
}

class _TurfImagesState extends State<TurfImages> {
  /// turfimagesApiSend this list send to api
  /// turfimagesshow this list only show images
  @override
  void initState() {
    super.initState();
    turfimagesshow.clear();
    turfimagesshow.add(XFile(""));
  }

  dynamic image1;
  String base64Image = "";
  File? selectedImage1;
  List<XFile> turfimagesshow = [];
  List<XFile> turfimagesApiSend = [];
  Future<void> chooseImage1(type) async {
    // turfimages.clear();
    // print("imageFileList${imageFileList.length}");
    if (type == "camera") {
      image1 = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 50);
      turfimagesshow.add(image1);
      turfimagesApiSend.add(image1);
      // print("ggggg${imageFileList.map((e) => e.path)}");
    } else {
      image1 = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      turfimagesshow.add(image1);
      turfimagesApiSend.add(image1);
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Turf Images",
          style: TextStyle(
            fontSize: 16,
            color: MyColor.black,
            fontFamily: ColorFamily.fontsPopinsDisplay,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 8.0,
                  shrinkWrap: true,
                  children: List.generate(turfimagesshow.length, (index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 1,
                        color: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        child: Container(
                            height: 50,
                            // width: 110,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: index == 0
                                ? InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            // <-- SEE HERE
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20.0),
                                            ),
                                          ),
                                          context: context,
                                          builder: ((builder) =>
                                              bottomSheet1()));
                                    },
                                    child: Image.asset(
                                      "assets/images/add_images_icon.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.22,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.11,
                                    ),
                                  )
                                : Stack(
                                    children: [
                                      SizedBox(
                                          // color: Colors.amber,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.48,
                                          child: selectedImage1 != null
                                              ? Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.27,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.13,
                                                              child: Image.file(
                                                                File(turfimagesshow[
                                                                        index]
                                                                    .path),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    // Positioned(
                                                    //   left: 80,
                                                    //   child: Image.asset(
                                                    //     "assets/images/delete_icon.png",
                                                    //     // width: 10,
                                                    //     height: 50,
                                                    //   ),
                                                    // ),
                                                  ],
                                                )
                                              : Container()),
                                      Positioned(
                                        left: 87,
                                        child: InkWell(
                                          onTap: () {
                                            turfimagesshow.removeAt(index - 1);
                                            setState(() {});
                                          },
                                          child: Image.asset(
                                            "assets/images/delete_icon.png",
                                            // width: 10,
                                            height: 35,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                      ),
                    );
                  })),
            ],
          )),
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
