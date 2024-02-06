import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckmanagement/Screens/dashboard_screen.dart';
import 'package:truckmanagement/Screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  islogin = sharedPreferences.getBool("isLogin");
  runApp(const MyApp());
}

bool? islogin;
init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  islogin = sharedPreferences.getBool("isLogin");

  debugPrint("islogin>>>>>>>$islogin");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
