import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';
import 'package:truckmanagement/Model/term_condition_model.dart';
import 'package:truckmanagement/constant/AppColor/app_colors.dart';
import 'package:truckmanagement/constant/api_constant.dart';
import 'package:truckmanagement/constant/app_fontfamily.dart';
import 'dart:convert' as convert;

import 'package:truckmanagement/constant/string_file.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({super.key});

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
  TermsConditionsModel termsConditionsModel = TermsConditionsModel();
  bool loading1 = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => termCondition(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          MyString.termsConditions.tr(),
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
                        termsConditionsModel.data!.description.toString(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<TermsConditionsModel> termCondition(
    BuildContext context,
  ) async {
    // Utility.progressloadingDialog(context, true);
    HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]);

    var response =
        await http.get(Uri.parse(ApiServer.termconditonapi), headers: {
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
      termsConditionsModel = TermsConditionsModel.fromJson(jsonResponse);

      // Parse HTML content to plain text
      String htmlContent = termsConditionsModel.data!.description
          .toString(); // Adjust the field name as per your model
      String plainText = parseHtmlString(htmlContent);

      // Update the model with plain text content
      termsConditionsModel.data!.description = plainText;
      setState(() {});

      // return termsConditionsModel;
    } else {
      setState(() {
        loading1 = false;
      });
    }

    return TermsConditionsModel.fromJson(jsonDecode(response.body));
  }

  String parseHtmlString(String htmlString) {
    // You can use flutter_html package or any other HTML parsing library
    // to convert HTML string to plain text.
    // Here's a simple approach using regex to strip HTML tags:
    return htmlString.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
