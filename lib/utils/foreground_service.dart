// import 'dart:async';

// import 'package:flutter/services.dart';
// import 'package:platform/platform.dart';

// class ForegroundService {
//   static const MethodChannel _channel =
//       MethodChannel('com.pauldemarco.foreground_service');

//   /// ticker only has usage with accessibility services enabled. It does not show a text in the status bar.
//   static Future start(
//       {required String title,
//       required String text,
//       required String subText,
//       required String ticker}) {
//     assert(const LocalPlatform().isAndroid);
//     final args = {
//       'title': title,
//       'text': text,
//       'subText': subText,
//       'ticker': ticker,
//     };
//     return _channel.invokeMethod('start', args);
//   }

//   static Future stop() {
//     assert(const LocalPlatform().isAndroid);
//     return _channel.invokeMethod('stop');
//   }
// }
