import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckmanagement/constant/utility.dart';

class TakePhoto {
  Future getMultipleImagesFromGallery(ImagePicker picker, List<XFile> imageList,
      Function onCallBack, BuildContext context) async {
    List<XFile> pickedFile = await picker.pickMultiImage(
      imageQuality: 80,
    );
    List images1 = [];
    images1.clear();
    if (pickedFile.isNotEmpty) {
      images1.addAll(pickedFile);
      if (images1.length <= 1) {
        imageList.addAll(pickedFile);
        onCallBack(imageList);
        // Utility.getToast(msg: "You can't select more than 20 images");
      } else {
        Utility.getToast(msg: "You select only one images");
        // imageList.addAll(pickedFile);
        // onCallBack(imageList);
      }
    } else {
      // Utility().getToast("Please select image");
    }
  }
}

class TakePhoto1 {
  Future getMultipleImagesFromGallery(ImagePicker picker,
      List<XFile> imageList1, Function onCallBack, BuildContext context) async {
    List<XFile> pickedFile = await picker.pickMultiImage(
      imageQuality: 80,
    );

    List images2 = [];
    images2.clear();
    if (pickedFile.isNotEmpty) {
      images2.addAll(pickedFile);
      if (images2.length <= 1) {
        imageList1.addAll(pickedFile);
        onCallBack(imageList1);
        // Utility.getToast(msg: "You can't select more than 20 images");
      } else {
        Utility.getToast(msg: "You select only one images");
        // imageList1.addAll(pickedFile);
        // onCallBack(imageList1);
      }
    } else {
      // Utility().getToast("Please select image");
    }
  }
}
