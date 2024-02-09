import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/diesel.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/apiconstant.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'package:truckmanagement/constant/mytakephoto.dart';
import 'package:truckmanagement/constant/utility.dart';
import 'package:truckmanagement/utils/mybuttons.dart';
import 'package:truckmanagement/utils/textfields.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as https;

class AddOnDieselscreen extends StatefulWidget {
  final String? tripId;
  final String? truckId;
  const AddOnDieselscreen({super.key, this.tripId, this.truckId});

  @override
  State<AddOnDieselscreen> createState() => _AddOnDieselscreenState();
}

class _AddOnDieselscreenState extends State<AddOnDieselscreen> {
  bool isLoading = false;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  int indeximage = 0;
  List<XFile> imageFileListBanner = [];
  // List<XFile> imageFileListBanner2 = [];
  final _picker = ImagePicker();
  // final _picker1 = ImagePicker();
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

  // getImage2(List<XFile> list) {
  //   setState(() {
  //     imageFileListBanner2 = list;
  //   });
  //   if (imageFileListBanner2.isNotEmpty) {
  //     ppp = true;
  //   }
  //   if (imageFileListBanner2.length >= 2) {
  //     ppp1 = true;
  //   }
  //   if (imageFileListBanner2.length >= 3) {
  //     ppp = true;
  //     ppp1 = true;
  //     ppp2 = true;
  //   }
  // }

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

  // Future<void> chooseImage2(type) async {
  //   // print("imageFileList${imageFileListBanner.length}");
  //   if (type == "camera") {
  //     // image1 = await ImagePicker().pickImage(
  //     //   source: ImageSource.camera,
  //     // );
  //     // imageFileListBanner.add(image1);
  //     // print("ggggg${imageFileListBanner.map((e) => e.path)}");

  //     if (selectedImage4 == null) {
  //       // print("ffffffffffffffffff");
  //       image1 = (await ImagePicker().pickImage(
  //         imageQuality: 50,
  //         source: ImageSource.camera,
  //       ))!;
  //       imageFileListBanner2.add(image1);
  //       ppp = true;
  //       setState(() {});
  //     } else if (selectedImage5 == null) {
  //       // print("rrrrrrrrrrrr");
  //       image2 = (await ImagePicker().pickImage(
  //         imageQuality: 50,
  //         source: ImageSource.camera,
  //       ))!;
  //       imageFileListBanner2.add(image2);
  //       ppp1 = true;
  //       setState(() {});
  //     } else if (selectedImage6 == null) {
  //       image3 = (await ImagePicker().pickImage(
  //         source: ImageSource.camera,
  //       ))!;
  //       imageFileListBanner2.add(image3);
  //       ppp2 = true;
  //       setState(() {});
  //     } else {
  //       image33 = (await ImagePicker().pickImage(
  //         source: ImageSource.camera,
  //       ))!;
  //       imageFileListBanner2.add(image33);
  //       ppp2 = true;
  //       setState(() {});
  //     }
  //     // print("imageFileListBanner${imageFileListBanner.map((e) => e)}");
  //   } else {
  //     if (selectedImage4 == null) {
  //       image1 = (await ImagePicker().pickImage(
  //         source: ImageSource.gallery,
  //       ))!;
  //       imageFileListBanner2.add(image1);
  //       ppp = true;
  //       setState(() {});
  //     } else if (selectedImage5 == null) {
  //       image2 = (await ImagePicker().pickImage(
  //         source: ImageSource.gallery,
  //       ))!;
  //       imageFileListBanner2.add(image2);
  //       ppp1 = true;
  //       setState(() {});
  //     } else if (selectedImage6 == null) {
  //       image3 = (await ImagePicker().pickImage(
  //         source: ImageSource.gallery,
  //       ))!;
  //       imageFileListBanner2.add(image3);
  //       ppp2 = true;
  //       setState(() {});
  //     } else {
  //       image33 = (await ImagePicker().pickImage(
  //         source: ImageSource.gallery,
  //       ))!;
  //       imageFileListBanner2.add(image33);
  //       ppp2 = true;
  //       setState(() {});
  //     }
  //     // print("imageFileListBanner${imageFileListBanner.length}");
  //   }
  //   // print("imageFileList>>>>>>>>>${imageFileListBanner.length}");
  //   setState(() {
  //     selectedImage1 = File(image1.path);
  //     base64Image = base64Encode(selectedImage4!.readAsBytesSync());
  //     // print(imageFileListBanner);
  //   });
  //   setState(() {
  //     selectedImage2 = File(image2.path);
  //     base64Image = base64Encode(selectedImage5!.readAsBytesSync());
  //     // print(imageFileListBanner);
  //   });
  //   setState(() {
  //     selectedImage3 = File(image3.path);
  //     base64Image = base64Encode(selectedImage6!.readAsBytesSync());
  //     // print(imageFileListBanner);
  //   });
  // }
  TextEditingController quantityLitersController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController enterNameOFStatationController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          "Add On Diesel",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shadowColor: Colors.white,
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  controller: quantityLitersController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration()
                      .prefixIconTextField(hintText: "   Quantity in liters"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2,
                shadowColor: Colors.white,
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  controller: unitPriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration()
                      .prefixIconTextField(hintText: "   Unit Price"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 2,
                shadowColor: Colors.white,
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  controller: enterNameOFStatationController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration().prefixIconTextField(
                      hintText: "   Enter name of petrol station"),
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
                            if (imageFileListBanner.isEmpty) {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                    // <-- SEE HERE
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.0),
                                    ),
                                  ),
                                  context: context,
                                  builder: ((builder) => bottomSheet1()));
                            } else {
                              Utility.getToast(
                                  toastColor:
                                      const Color.fromARGB(255, 34, 71, 99),
                                  msg: "You select only one images");
                            }
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
              // const SizedBox(
              //   height: 10,
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                        isLoading: isLoading,
                        // color: MyColor.transparent,
                        textStyle: const TextStyle(
                          color: MyColor.white,
                          fontSize: 16,
                          fontFamily: ColorFamily.fontsSFProDisplay,
                          fontWeight: FontWeight.w600,
                        ),
                        btnWidth: MediaQuery.of(context).size.width * 0.90,
                        onPressed: () {
                          var quantityLiters = quantityLitersController.text;
                          var unitPrice = unitPriceController.text;
                          var enterNameOFStatation =
                              enterNameOFStatationController.text;
                          if (quantityLiters.isEmpty == true) {
                            Utility.getToast(
                                toastColor:
                                    const Color.fromARGB(255, 34, 71, 99),
                                msg: "Fill exact quantity in liters");
                          } else if (unitPrice.isEmpty == true) {
                            Utility.getToast(
                                toastColor:
                                    const Color.fromARGB(255, 34, 71, 99),
                                msg: "Fill exact unit price");
                          } else if (enterNameOFStatation.isEmpty == true) {
                            Utility.getToast(
                                toastColor:
                                    const Color.fromARGB(255, 34, 71, 99),
                                msg: "Fill exact Enter name of petrol station");
                          } else {
                            addondieselApi(context, quantityLiters, unitPrice,
                                enterNameOFStatation);
                          }
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
              // const SizedBox(
              //   height: 10,
              // ),
            ]),
      )),
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
                    if (imageFileListBanner.isEmpty) {
                      chooseImage1("camera");
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
                  if (imageFileListBanner.isEmpty) {
                    TakePhoto().getMultipleImagesFromGallery(
                        _picker, imageList, getImage, context);
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

  Future<Dieselrespose> addondieselApi(context, String quantityLiters,
      String unitPrice, String petrolStation) async {
    setLoading(true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      "content-type": "application/json",
      "Accept": "application/json",
      'Authorization':
          "Bearer ${sharedPreferences.getString("TOKEN").toString()}",
    };

    var uri = Uri.parse(ApiServer.addondiesel);

    var request = https.MultipartRequest('post', uri)..headers.addAll(headers);
    request.fields['quantity_in_litres'] = quantityLiters;
    request.fields['unit_price'] = unitPrice;
    request.fields['trip_id'] = widget.tripId.toString();
    request.fields['petrol_station'] = petrolStation;
    request.files.add(await https.MultipartFile.fromPath(
        'existing_diesel_image', imageFileListBanner[0].path));
    request.files.add(await https.MultipartFile.fromPath(
        'petrol_station_image', imageFileListBanner[0].path));

    var response = await https.Response.fromStream(await request.send());

    var body = json.decode(response.body);
    setLoading(true);
    if (response.statusCode == 200 && body['status'] == true) {
      Navigator.pop(context);
      debugPrint("response.body>>>>>>>>>>${response.body}");
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => TripDetials(
      //               tripId: widget.tripId,
      //               truckId: widget.truckId,
      //             )));
    } else {
      debugPrint("response.body>>>>>>>>>>${response.body}");
    }
    return Dieselrespose.fromJson(jsonDecode(response.body));
  }
}
