import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Curus/Model/Patient.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class MyJson extends StatefulWidget {
  @override
  _MyJsonState createState() => _MyJsonState();
}

class _MyJsonState extends State<MyJson> {
  Future<List<Patient>> _getPatient() async{
    var patientData=await http.get("https://raw.githubusercontent.com/Bhavna121/json/master/mock_data.json");
    var jsonData=json.decode(patientData.body);
    List<Patient> patients=[];
    for(var p in jsonData)
    {
      Patient patient=Patient(p["id"],p["image"],p["first_name"],p["description"],p["gender"]);
      patients.add(patient);
    }
    return patients;
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: CircleAvatar(
          backgroundImage: AssetImage(
            "assets/logo.png",
            ),
          ),
         onPressed: () {
            Navigator.pushNamed(context, "home");
            },
        ),
        title:Text("Curus Health",
        style: TextStyle(
          fontFamily: "Times New Roman",
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.mic,
          color: Colors.blue,),
          onPressed: () {
            Navigator.pushNamed(context, "myspeechscreen");
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue,
        child: FutureBuilder(
          future: _getPatient(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data==null)
            {
              return Container(
                child: Center(
                  child: Text("Loading...",
                  style: TextStyle(
                    fontFamily: "Times New Roman",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ) ,
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder:(BuildContext context, int index){
                  if(snapshot.data[index].gender == "Male"){
                    return Card(
                      child: Padding(
                      padding: const EdgeInsets.only(top:32.0, bottom: 32, left: 16.0, right: 16.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data[index].image),
                          ),
                        title: Text("Mr. "+snapshot.data[index].first_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        subtitle: Text(snapshot.data[index].description),
                      ),
                    ),
                  );
                  }
                  else{
                    return Card(
                      child: Padding(
                      padding: const EdgeInsets.only(top:32.0, bottom: 32, left: 16.0, right: 16.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data[index].image),
                          ),
                        title: Text("Mrs."+snapshot.data[index].first_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        subtitle: Text(snapshot.data[index].description),
                      ),
                    ),
                  );
                  }
                } ,
              );
            }
          },
        ),
      ),
    );
  }
}