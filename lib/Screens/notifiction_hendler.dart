import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Model/notification_data_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
bool navcheck = false;
bool navcheckchating = false;
dynamic msgdata;
dynamic notifiactiondata;

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void notificationTapBackground(message) {
    // print('>>>>>>>>>>>>>>>>3');
    // debugPrint('---notificationTapBackground');

    _handleMessage(message);
    chatReceivedUpdate(message!.data['chatId'], message.data['msgId']);
    // print('notification(${notificationResponse.id}) action tapped: '
    //     '${notificationResponse.actionId} with'
    //     ' payload: ${notificationResponse.payload}');
    // if (notificationResponse.input?.isNotEmpty ?? false) {
    //   print(
    //       'notification action tapped with input: ${notificationResponse.input}');
    // }
  }

  static void initialize() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
        onDidReceiveNotificationResponse: (message) {
      // debugPrint('---onDidReceiveNotificationResponse');
      notificationTapBackground(message);
    });
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            "high_importance_channel",
            "High Importance Notifications",
            importance: Importance.max,
          ),
        );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    // try {
    //   await FirebaseMessaging.instance.setAutoInitEnabled(true);
    //   String? fcmToken;
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   if (Platform.isIOS || Platform.isMacOS) {
    //     fcmToken = await FirebaseMessaging.instance.getToken();
    //   } else {
    //     fcmToken = await FirebaseMessaging.instance.getToken();
    //   }
    //   if (fcmToken?.isNotEmpty ?? false) {
    //     prefs.setString("fcmtoken", fcmToken.toString());
    //   }
    //   // ignore: empty_catches
    // } catch (e) {}

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) async {
        // debugPrint('FirebaseMessaging.instance.getInitialMessage is $message');
        // final FirebaseFirestore firestore = FirebaseFirestore.instance;

        if (message != null) {
          // debugPrint('data 5555555kkkkkkkkkkkkk is $message');
          var notificationData = NotificationDataModel.fromJson(message.data);

          _handleMessage(notificationData);
          // chatReceivedUpdate(message.data['chatId'], message.data['msgId']);
          // debugPrint('New Notification');
        }
      },
    );

    FirebaseMessaging.onBackgroundMessage((message) async {
      var notificationData = NotificationDataModel.fromJson(message.data);
      // debugPrint('onBackgroundMessage is $message');
      chatReceivedUpdate(message.data['chatId'], message.data['msgId']);
      _handleMessage(notificationData);

      // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    });
    FirebaseMessaging.onMessage.listen(
      (message) async {
        msgdata = message.notification!.title;
        // debugPrint(
        //     'FirebaseMessaging.onMessage.listen is ${message.data.toString()}');

        if (message.notification != null) {
          // debugPrint("message.notification>>>>>>>${message.notification}");
          display(message);
          _flutterLocalNotificationsPlugin.initialize(initializationSettings,
              onDidReceiveBackgroundNotificationResponse:
                  notificationTapBackground,
              onDidReceiveNotificationResponse: (msg) {
            var notificationData = NotificationDataModel.fromJson(message.data);

            _handleMessage(notificationData);
            if (message.data["click_action"] != "FLUTTER_NOTIFICATION_CLICK") {
              chatReceivedUpdate(message.data['chatId'], message.data['msgId']);
            }
          });
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        debugPrint("message>>>>>>>>>>$message");
        var notificationData = NotificationDataModel.fromJson(message.data);
        if (message.data["click_action"] != "FLUTTER_NOTIFICATION_CLICK") {
          chatReceivedUpdate(message.data['chatId'], message.data['msgId']);
        }
        _handleMessage(notificationData);
      },
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  void data2() async {
    msgdata;

    // await _firestore.collection("chats").d
    //     // .where("members", arrayContains:sharedPreferences.getString("User_Id").toString()).
    //     ;
  }

  static void display(RemoteMessage message) async {
    debugPrint('data 5555555666666666666>>>>>>>>> is ${message.data}.');
    notifiactiondata = message.data["chatmsg"];

    // chatReceivedUpdate('nyyt', 'rgt');
    // if (message.data['chatmsg'].toString() != "chatmsg") {
    try {
      // debugPrint('In Notification method');
      Random random = Random();
      int id = random.nextInt(1000);
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "high_importance_channel",
          "High Importance Notifications",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );
      // debugPrint('my id is ${id.toString()}');

      await _flutterLocalNotificationsPlugin.show(
        id,
        message.notification?.title ?? 'N/A',
        message.notification?.body ?? 'N/A',
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      debugPrint('Error>>>$e');
      // }
    }
    // if (message.data["click_action"] != "FLUTTER_NOTIFICATION_CLICK") {
    //   chatReceivedUpdate(message.data['chatId'], message.data['msgId']);
    // }
  }
}

Future<dynamic> onSelectNotification(payload) async {}

data() {}

void _handleMessage(NotificationDataModel data) async {
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // String? islogin = sharedPreferences.getString("user_Idrole");
  // _addBadge();
  debugPrint('data _handleMessage>>data>>>>>>> is $data.');
  debugPrint(
      'data notifiactiondata>>_handleMessage>>>>>>> is $notifiactiondata.');
  debugPrint('data data.screen>>>_handleMessage>>>>>> is ${data.screen}.');
  // if (notifiactiondata == "chatmsg") {
  //   if (navcheckchating == false) {
  //     debugPrint('data.screen>>>2>>>>>> is ${data.screen}.');
  //     // navigatorKey.currentState
  //     //     ?.push(MaterialPageRoute(builder: (context) => const ChatlistScrt()));
  //   } else {
  //     debugPrint('data.screen>>>>3>>>>> is ${data.screen}.');
  //     // navigatorKey.currentState?.pushReplacement(
  //     //     MaterialPageRoute(builder: (context) => const ChatlistScrt()));
  //   }
  // }

  // if (notifiactiondata != "chatmsg") {
  //   if (data.screen == 'PropertyDetails' && islogin.toString() == 'user' ||
  //       islogin.toString() == '1' ||
  //       islogin.toString() == '0' ||
  //       islogin.toString() == 'provider') {
  //     debugPrint('data.screen>>>>>1>>>> is ${data.screen}.');
  //     // navigatorKey.currentState?.push(MaterialPageRoute(
  //     //     builder: (context) => PropertyDetails(
  //     //           oncallfavrate: () {},
  //     //           oncallfavrate1: () {},
  //     //           id: data.propertyId.toString(),
  //     //           cityid: data.cityId.toString(),
  //     //         )));

  //     if (navcheck == false) {
  //       debugPrint('data.screen>>>2>>>>>> is ${data.screen}.');
  //       // navigatorKey.currentState?.push(MaterialPageRoute(
  //       //     builder: (context) => const Notificationpro(
  //       //           notifycheck: "true",
  //       //         )));
  //     } else {
  //       debugPrint('data.screen>>>>3>>>>> is ${data.screen}.');
  //       // navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
  //       //     builder: (context) => const Notificationpro(
  //       //           notifycheck: "true",
  //       //         )));
  //     }
  //   } else {
  //     Fluttertoast.showToast(msg: 'hello', timeInSecForIosWeb: 30);
  //   }
  // }
}

void chatReceivedUpdate(String chatId, String msgId) async {
  // debugPrint("chatReceivedUpdate>>>>");
  // debugPrint("chatReceivedUpdate>>>>$chatId");
  // debugPrint("chatReceivedUpdate>>>>$msgId");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore
      .collection("chats")
      .doc(chatId)
      .collection("messages")
      .doc(msgId)
      .update({
    "status": "1"
    // Your update data here
  });
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
void setStat(String status) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await _firestore
      .collection("users")
      .doc(
        sharedPreferences.getString("User_Id").toString(),
      )
      .update({
    "is_online": status,
  });
}

@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  if (state == AppLifecycleState.resumed) {
    setStat("Online");
  } else {
    setStat("offline");
  }
}

// void _addBadge() {
//   FlutterAppBadger.updateBadgeCount(1);
// }

void dataa() {
  navigatorKey.currentState?.pop();
}
