import 'package:commutifyy/auth_page.dart';
import 'package:commutifyy/homepage.dart';
import 'package:commutifyy/services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();



  await Firebase.initializeApp();
  //await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthScreen(),
      ),
    );
  }
}
