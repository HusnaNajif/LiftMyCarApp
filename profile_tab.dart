import 'package:driver_app/SplashScreen.dart';
import 'package:driver_app/global/global.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
        fauth.signOut();
        Fluttertoast.showToast(msg: "Sign out successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SplashScreen();
        }));
      }, child: Text("Sign out")),
    );
  }
}
