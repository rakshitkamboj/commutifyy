import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:commutifyy/data_modals/user_location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:commutifyy/services/location_services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
void firealarm() {
  print("Added");
}

class HomePage extends StatefulWidget {
  GoogleSignIn _googleSignIn;
  User _user;
  HomePage(User user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int alarmID = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AndroidAlarmManager.periodic(Duration(seconds: 5), alarmID, firealarm);
  }

  @override
  Widget build(BuildContext context) {
    var userlocation = Provider.of<UserLocation>(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(

            children: [
              Text('Welcome${widget._user.displayName}'),
              ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return userlocation.lat.isEmpty
                      ? Text("Empty")
                      : TextButton(onPressed: () {}, child: Text("nearby"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
