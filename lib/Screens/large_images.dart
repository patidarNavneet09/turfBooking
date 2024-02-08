import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';

class LargeImages extends StatefulWidget {
  final String? imagesUrl;
  final String? nameProperty;
  const LargeImages({super.key, this.imagesUrl, this.nameProperty});

  @override
  State<LargeImages> createState() => _LargeImagesState();
}

class _LargeImagesState extends State<LargeImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          widget.nameProperty.toString(),
          style: const TextStyle(
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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PhotoView(
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white, // Set the background color here
                  ),
                  imageProvider: NetworkImage(widget.imagesUrl.toString())),
            ),
          );
        },
      ),
    );
  }
}
