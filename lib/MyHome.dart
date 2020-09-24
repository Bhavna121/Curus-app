import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue.shade300);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: SizedBox(),
        title:Text("Curus Health",
        style: TextStyle(
          fontFamily: "Times New Roman",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
      ),

      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/background.png"),
                  fit: BoxFit.cover),
                  ),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75.0),
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(20),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  child: Text('Patient Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Times New Roman",
                    fontSize: 15,
                  ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "myjson");
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(20),
                elevation: 10,
                child: MaterialButton(
                  child: Text('Speech to Text',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Times New Roman",
                    fontSize: 15,
                  ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "myspeechscreen");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
