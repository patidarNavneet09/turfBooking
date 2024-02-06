import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:truckmanagement/Model/privacypolicymodel.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/apiconstant.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'dart:convert' as convert;

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  PrivacyPolicyModel privacyPolicyModel = PrivacyPolicyModel();
  bool loading1 = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => privacypolicy(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          "PrivacyPolicy",
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
      body: loading1 == true
          ? Center(
              child: Image.asset("assets/images/gif_loader.gif"),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  // Wrap with SingleChildScrollView
                  child: Column(
                    children: [
                      Text(
                        privacyPolicyModel.data!.description.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<PrivacyPolicyModel> privacypolicy(
    BuildContext context,
  ) async {
    // Utility.progressloadingDialog(context, true);
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response = await http.get(Uri.parse(ApiServer.privacypolicy), headers: {
      "content-type": "application/json",
      "accept": "application/json",
      "client": "Bearer JzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkMkJSEyXiopIiw",
    });

    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

    loading1 = true;
    if (jsonResponse['status'] == true) {
      setState(() {
        loading1 = false;
      });
      privacyPolicyModel = PrivacyPolicyModel.fromJson(jsonResponse);

      // Parse HTML content to plain text
      String htmlContent = privacyPolicyModel.data!.description
          .toString(); // Adjust the field name as per your model
      String plainText = parseHtmlString(htmlContent);

      // Update the model with plain text content
      privacyPolicyModel.data!.description = plainText;
      setState(() {});
    } else {
      setState(() {
        loading1 = false;
      });
    }

    return PrivacyPolicyModel.fromJson(jsonDecode(response.body));
  }

  String parseHtmlString(String htmlString) {
    // You can use flutter_html package or any other HTML parsing library
    // to convert HTML string to plain text.
    // Here's a simple approach using regex to strip HTML tags:
    return htmlString.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
