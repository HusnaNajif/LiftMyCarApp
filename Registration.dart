

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/Authentication/Login.dart';
import 'package:driver_app/global/global.dart';
import 'package:driver_app/progress_widget/progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  validation(){
    if(namecontroller.text.length<3){
      Fluttertoast.showToast(msg: "Name should contain atleast 3 character");

    }
    else if(!emailcontroller.text.contains('@')){
      Fluttertoast.showToast(msg: "Invalid Email");
    }
    else if(passwordcontroller.text.isEmpty){
      Fluttertoast.showToast(msg: "Invalid Email");

    }
    else if(passwordcontroller.text.length<6){
      Fluttertoast.showToast(msg: "Password should contain 6 characters");
    }
    else{
      saveInformation();

    }

  }
  saveInformation() async{
    showDialog(context: context,barrierDismissible: false, builder: (BuildContext c){
      return Progress(message: "Processing..please wait");
    });

    final User? firebaseUser=(
        await fauth.createUserWithEmailAndPassword(

            email: emailcontroller.text.trim(),
            password: passwordcontroller.text.trim()).then((value) {
              FirebaseFirestore.instance.collection('customers').doc(value.user?.uid).set({"email":value.user?.email,"id":value.user?.uid});
              

        }))
    ;

    Fluttertoast.showToast(msg: "Account has  Created");
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Login();}));



  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Image.asset("assets/images/splashimage.jpg"),
                SizedBox(height: 10,),
                Text("Register as Driver",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                color: Colors.white),),
                TextField(
                  controller: namecontroller,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.grey,fontSize: 18),
                  decoration: InputDecoration(labelText: "Name",
                      labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter Name",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)
                  ),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)))),


                TextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress
                    ,
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
                    decoration: InputDecoration(labelText: "Password",labelStyle: TextStyle(color: Colors.grey),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)))),
                SizedBox(height: 12,),
                ElevatedButton(onPressed: (){
                  validation();

                }, child: Text("Create Account",
                  style: TextStyle(color: Colors.black,fontSize: 20),),style: ElevatedButton.styleFrom(primary: Colors.lightGreenAccent),),
                SizedBox(height: 10,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Login();
                  }));
                }, child: Text("Already have an account?Login Here",style: TextStyle(
                  color: Colors.grey,fontSize: 20
                ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
