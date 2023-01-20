import 'dart:async';
import 'package:driver_app/Authentication/Login.dart';
import 'package:driver_app/MainScreen.dart';
import 'package:driver_app/global/global.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer(){
    Timer(Duration(seconds: 8), ()async {
      if(await fauth.currentUser!=null){
        currentFirebaseUser=fauth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return MainScreen();
        }));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Login();
        }));
      }

      
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/splashimage.jpg"),
            SizedBox(height: 10,),
            Text("Driver & User App",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),)
          ],
        ),
      ),
    );
  }
}

