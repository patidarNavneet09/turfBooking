import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/constant/mytakephoto.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
import 'package:truckmanagement/utils/textfields.dart';

class FinesScreen extends StatefulWidget {
  const FinesScreen({super.key});

  @override
  State<FinesScreen> createState() => _FinesScreenState();
}

class _FinesScreenState extends State<FinesScreen> {
  int indeximage = 0;
  List<XFile> imageFileListBanner = [];
  List<XFile> imageFileListBanner2 = [];
  final _picker = ImagePicker();
  final _picker1 = ImagePicker();
  List<XFile> imageList = [];
  List<XFile> imageList2 = [];
  getImage(List<XFile> list) {
    setState(() {
      imageFileListBanner = list;
    });
    if (imageFileListBanner.isNotEmpty) {
      ppp = true;
    }
    if (imageFileListBanner.length >= 2) {
      ppp1 = true;
    }
    if (imageFileListBanner.length >= 3) {
      ppp = true;
      ppp1 = true;
      ppp2 = true;
    }
  }

  getImage2(List<XFile> list) {
    setState(() {
      imageFileListBanner2 = list;
    });
    if (imageFileListBanner2.isNotEmpty) {
      ppp = true;
    }
    if (imageFileListBanner2.length >= 2) {
      ppp1 = true;
    }
    if (imageFileListBanner2.length >= 3) {
      ppp = true;
      ppp1 = true;
      ppp2 = true;
    }
  }

  File? image;
  String base64Image = "";
  File? selectedImage1;
  File? selectedImage2;
  File? selectedImage3;
  File? selectedImage4;
  File? selectedImage5;
  File? selectedImage6;
  late XFile image33;
  late XFile image1;
  late XFile image2;
  late XFile image3;
  bool ppp = false;
  bool ppp1 = false;
  bool ppp2 = false;
  bool isChecked = false;
  String? selectedId = " ";
  Future<void> chooseImage1(type) async {
    // print("imageFileList${imageFileListBanner.length}");
    if (type == "camera") {
      // image1 = await ImagePicker().pickImage(
      //   source: ImageSource.camera,
      // );
      // imageFileListBanner.add(image1);
      // print("ggggg${imageFileListBanner.map((e) => e.path)}");

      if (selectedImage1 == null) {
        // print("ffffffffffffffffff");
        image1 = (await ImagePicker().pickImage(
          imageQuality: 50,
          source: ImageSource.camera,
        ))!;
        imageFileListBanner.add(image1);
        ppp = true;
        setState(() {});
      } else if (selectedImage2 == null) {
        // print("rrrrrrrrrrrr");
        image2 = (await ImagePicker().pickImage(
          imageQuality: 50,
          source: ImageSource.camera,
        ))!;
        imageFileListBanner.add(image2);
        ppp1 = true;
        setState(() {});
      } else if (selectedImage3 == null) {
        image3 = (await ImagePicker().pickImage(
          source: ImageSource.camera,
        ))!;
        imageFileListBanner.add(image3);
        ppp2 = true;
        setState(() {});
      } else {
        image33 = (await ImagePicker().pickImage(
          source: ImageSource.camera,
        ))!;
        imageFileListBanner.add(image33);
        ppp2 = true;
        setState(() {});
      }
      // print("imageFileListBanner${imageFileListBanner.map((e) => e)}");
    } else {
      if (selectedImage1 == null) {
        image1 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
        ))!;
        imageFileListBanner.add(image1);
        ppp = true;
        setState(() {});
      } else if (selectedImage2 == null) {
        image2 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
        ))!;
        imageFileListBanner.add(image2);
        ppp1 = true;
        setState(() {});
      } else if (selectedImage3 == null) {
        image3 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
        ))!;
        imageFileListBanner.add(image3);
        ppp2 = true;
        setState(() {});
      } else {
        image33 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
        ))!;
        imageFileListBanner.add(image33);
        ppp2 = true;
        setState(() {});
      }
      // print("imageFileListBanner${imageFileListBanner.length}");
    }
    // print("imageFileList>>>>>>>>>${imageFileListBanner.length}");
    setState(() {
      selectedImage1 = File(image1.path);
      base64Image = base64Encode(selectedImage1!.readAsBytesSync());
      // print(imageFileListBanner);
    });
    setState(() {
      selectedImage2 = File(image2.path);
      base64Image = base64Encode(selectedImage1!.readAsBytesSync());
      // print(imageFileListBanner);
    });
    setState(() {
      selectedImage3 = File(image3.path);
      base64Image = base64Encode(selectedImage1!.readAsBytesSync());
      // print(imageFileListBanner);
    });
  }

  Future<void> chooseImage2(type) async {
    // print("imageFileList${imageFileListBanner.length}");
    if (type == "camera") {
      // image1 = await ImagePicker().pickImage(
      //   source: ImageSource.camera,
      // );
      // imageFileListBanner.add(image1);
      // print("ggggg${imageFileListBanner.map((e) => e.path)}");

      if (selectedImage4 == null) {
        // print("ffffffffffffffffff");
        image1 = (await ImagePicker().pickImage(
          imageQuality: 50,
          source: ImageSource.camera,
        ))!;
        imageFileListBanner2.add(image1);
        ppp = true;
        setState(() {});
      } else if (selectedImage5 == null) {
        // print("rrrrrrrrrrrr");
        image2 = (await ImagePicker().pickImage(
          imageQuality: 50,
          source: ImageSource.camera,
        ))!;
        imageFileListBanner2.add(image2);
        ppp1 = true;
        setState(() {});
      } else if (selectedImage6 == null) {
        image3 = (await ImagePicker().pickImage(
          source: ImageSource.camera,
        ))!;
        imageFileListBanner2.add(image3);
        ppp2 = true;
        setState(() {});
      } else {
        image33 = (await ImagePicker().pickImage(
          source: ImageSource.camera,
        ))!;
        imageFileListBanner2.add(image33);
        ppp2 = true;
        setState(() {});
      }
      // print("imageFileListBanner${imageFileListBanner.map((e) => e)}");
    } else {
      if (selectedImage4 == null) {
        image1 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
        ))!;
        imageFileListBanner2.add(image1);
        ppp = true;
        setState(() {});
      } else if (selectedImage5 == null) {
        image2 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
        ))!;
        imageFileListBanner2.add(image2);
        ppp1 = true;
        setState(() {});
      } else if (selectedImage6 == null) {
        image3 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
        ))!;
        imageFileListBanner2.add(image3);
        ppp2 = true;
        setState(() {});
      } else {
        image33 = (await ImagePicker().pickImage(
          source: ImageSource.gallery,
        ))!;
        imageFileListBanner2.add(image33);
        ppp2 = true;
        setState(() {});
      }
      // print("imageFileListBanner${imageFileListBanner.length}");
    }
    // print("imageFileList>>>>>>>>>${imageFileListBanner.length}");
    setState(() {
      selectedImage1 = File(image1.path);
      base64Image = base64Encode(selectedImage4!.readAsBytesSync());
      // print(imageFileListBanner);
    });
    setState(() {
      selectedImage2 = File(image2.path);
      base64Image = base64Encode(selectedImage5!.readAsBytesSync());
      // print(imageFileListBanner);
    });
    setState(() {
      selectedImage3 = File(image3.path);
      base64Image = base64Encode(selectedImage6!.readAsBytesSync());
      // print(imageFileListBanner);
    });
  }

  String dropdownvalue = 'Select Accident Category';

  // List of items in our dropdown menu
  final List<String> items = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          "Fines",
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
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  // controller: passwordphoneController,
                  keyboardType: TextInputType.text,

                  decoration: const InputDecoration()
                      .prefixIconTextField(hintText: "   Fine Name"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  // controller: passwordphoneController,
                  keyboardType: TextInputType.text,

                  decoration: const InputDecoration()
                      .prefixIconTextField(hintText: "   Amount"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyColor.greyText),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  // controller: passwordphoneController,
                  keyboardType: TextInputType.text,

                  maxLines: 5,

                  decoration: const InputDecoration()
                      .prefixIconTextField(hintText: "   Description"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Upload photo",
                style: TextStyle(
                  fontSize: 14,
                  color: MyColor.greyText2,
                  // overflow: TextOverflow.ellipsis,
                  fontFamily: ColorFamily.fontsSFProDisplay,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 100,
                width: screen.size.width,
                // decoration: BoxDecoration(
                //   border: Border.all(width: 1, color: MyColor.black),
                //   borderRadius: const BorderRadius.all(Radius.circular(10)),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text("You can add upto 3 photos".tr),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            indeximage = 1;
                            setState(() {});
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
                          child: DottedBorder(
                              color: MyColor.button,
                              strokeWidth: 2,
                              borderType: BorderType.Rect,
                              dashPattern: const [5, 10],
                              child: Container(
                                  margin: const EdgeInsets.all(1),
                                  height: 50,
                                  width: 53,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: MyColor.greyText,
                                  ))),
                        ),
                        SizedBox(
                          width: screen.size.width * 0.68,
                          height: 62,
                          child: imageFileListBanner.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 2, bottom: 2),
                                  child: SizedBox(
                                    width: screen.size.width * 0.60,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: MyColor.button),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          height: 100,
                                          width: 60,
                                          child: const Icon(
                                            Icons.photo,
                                            color: MyColor.button,
                                          ),
                                        ),
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //         width: 1, color: MyColor.black),
                                        //     borderRadius:
                                        //         const BorderRadius.all(
                                        //             Radius.circular(10)),
                                        //   ),
                                        //   height: 100,
                                        //   width: 60,
                                        //   child: const Icon(Icons.photo),
                                        // ),
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //     border: Border.all(
                                        //         width: 1, color: MyColor.black),
                                        //     borderRadius:
                                        //         const BorderRadius.all(
                                        //             Radius.circular(10)),
                                        //   ),
                                        //   height: 100,
                                        //   width: 60,
                                        //   child: const Icon(Icons.photo),
                                        // ),
                                      ],
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imageFileListBanner.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: 100,
                                                  width: 65,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              width: 2,
                                                              color: MyColor
                                                                  .button),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          12)),
                                                        ),
                                                        height: 65,
                                                        width: 65,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          child: Image.file(
                                                            File(
                                                                imageFileListBanner[
                                                                        index]
                                                                    .path),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 65,
                                                  width: 66,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                          radius: 20,
                                                          onTap: () {
                                                            imageFileListBanner
                                                                .removeAt(
                                                                    index);
                                                            setState(() {});
                                                          },
                                                          child: SizedBox(
                                                            width: 20,
                                                            child: Image.asset(
                                                                "assets/images/cross.png"),
                                                          )
                                                          // child:
                                                          //     const CircleAvatar(
                                                          //   backgroundColor:
                                                          //       MyColor
                                                          //           .transparent,
                                                          //   radius: 10,
                                                          //   child: Text(
                                                          //     'x',
                                                          //     style: TextStyle(
                                                          //         color: MyColor
                                                          //             .white),
                                                          //   ),
                                                          // ),
                                                          ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
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
                          Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const addonAddExpenstion()));
                        },
                        name: "Submit"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet1() {
    return Container(
      height: 100.0,
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
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    if (indeximage == 1) {
                      chooseImage1("camera");
                    } else {
                      chooseImage2("camera");
                    }
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
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // chooseImage1("Gallery");
                  if (indeximage == 1) {
                    TakePhoto().getMultipleImagesFromGallery(
                        _picker, imageList, getImage, context);
                  } else {
                    TakePhoto1().getMultipleImagesFromGallery(
                        _picker1, imageList2, getImage2, context);
                  }
                },
                icon: const Icon(
                  Icons.image,
                  color: MyColor.black,
                ),
                label: const Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 10,
                    color: MyColor.black,
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
