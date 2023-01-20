import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  String? message;
  Progress({Key? key,this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,

        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [SizedBox(width: 5,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(width: 20,),
            Text(message!,style: TextStyle(color: Colors.grey,fontSize: 12),)],

          ),
        ),
      ),

    );
  }
}
