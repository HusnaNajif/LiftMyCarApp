import 'package:driver_app/Authentication/Registration.dart';
import 'package:driver_app/MainScreen.dart';
import 'package:driver_app/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';
import '../progress_widget/progress.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  validation(){
    if(emailcontroller.text.length<3){
      Fluttertoast.showToast(msg: "Name should contain atleast 3 character");

    }
    else if(!emailcontroller.text.contains('@')){
      Fluttertoast.showToast(msg: "Invalid Email");
    }
    else if(passwordcontroller.text.isEmpty){
      Fluttertoast.showToast(msg: "Enter Phone number");

    }

    else if(passwordcontroller.text.length<6){
      Fluttertoast.showToast(msg: "Password should contain 6 characters");
    }
    else{
      LoginDriver();

    }

  }
  LoginDriver() async{
    showDialog(context: context,barrierDismissible: false, builder: (BuildContext c){
      return Progress(message: "Processing..please wait");
    });

    final User? firebaseUser=(
        await fauth.createUserWithEmailAndPassword(
            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim()).then((value) {
         print("login successfull");


        }));
    Fluttertoast.showToast(msg: "Login successfull");
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MainScreen();}));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Image.asset("assets/images/splashimage.jpg"),
              SizedBox(height: 10,),
              Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                  color: Colors.white),),
              TextField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.grey,fontSize: 18),
                  decoration: InputDecoration(labelText: "Email",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Enter Email",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)))),
              TextField(
                  controller: passwordcontroller,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(color: Colors.grey,fontSize: 18),
                  decoration: InputDecoration(labelText: "Password",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)
                      ),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)))),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){
                validation();


              }, child: Text("Login into Account",
                style: TextStyle(color: Colors.black,fontSize: 20),),style: ElevatedButton.styleFrom(primary: Colors.lightGreenAccent),),
              SizedBox(height: 15,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Registration();
                }));
              }, child: Text("Dont have an account?",style: TextStyle(color: Colors.grey,fontSize: 20),)),

            ],),
          ),
        ),
      ),
    );
  }
}
