import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Screens/dashboard_screen.dart';
import 'package:truckmanagement/Screens/login_screen.dart';
import 'package:truckmanagement/Screens/notifiction_hendler.dart';
import 'package:truckmanagement/constant/utility.dart';

// kkkk
String fcmtoken = "";
FirebaseMessaging messaging = FirebaseMessaging.instance;
void pushFCMtoken() async {
  try {
    // Get the FCM token
    String? token = await messaging.getToken();
    fcmtoken = token.toString();
    // Store the FCM token in shared preferences
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("fcmtoken", fcmtoken.toString());
    debugPrint("FCM Token:>>>>>>>>>>>>>>> $fcmtoken");
  } catch (e) {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    debugPrint("Error getting FCM token: $e");
    var check = preferences.getString("fcmtoken");
    if (check == null) {
      pushFCMtoken();

      debugPrint("Error getting FCM token>>>>>>>>>>>>.......check: $check");
    }
  }
}

bool? islogin;
void notificationTapBackground(NotificationResponse notificationResponse) {
  debugPrint('Notification (${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    debugPrint(
        'Notification action tapped with input: ${notificationResponse.input}');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  await init();
  // Call pushFCMtoken in main
  pushFCMtoken();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  islogin = sharedPreferences.getBool("isLogin");
  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  var locale = await Utility.getLanguage();
  runApp(EasyLocalization(
    supportedLocales: const [
      //English en-US, Italian it-IT, German de-DE, French fr-FR
      Locale('en', 'US'),
      // Locale('it', 'IT'),
      // Locale('de', 'DE'),
      // Locale('fr', 'FR'),
    ],
    path: 'assets/translations',
    fallbackLocale: locale,
    child: const MyApp(),
  ));
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  debugPrint('>>>>>>>>>>>>>>>>out>>>chatId>>>>$message');

  // print('>>>>>>>>>>>>>>>>out>>chatmsg>>>>>${message.data['chatmsg']}');

  // print('>>>>>>>>>>>>>>>>out>>>>>');

  // chatReceivedUpdate(message.data['chatId'], message.data['msgId']);
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationService.initialize();

  // Add the onBackgroundMessage handler here

  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

  debugPrint("islogin>>>>>>>$islogin");
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    prefences();
  }

  prefences() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    islogin = sharedPreferences.getBool("isLogin");
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Truck_Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: islogin.toString() == "true"
          ? const DashBoardscreen(
              pagesProviderIndex: 0,
            )
          : const Login(),
    );
  }
}
