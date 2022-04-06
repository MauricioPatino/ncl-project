import 'package:flutter/material.dart';
import 'package:ncl/model/shipModel.dart';
import 'package:ncl/screen/shipScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

    Future<void> getNCLData() async {
    var sky = await (Uri.parse("https://www.ncl.com/cms-service/cruise-ships/SKY"));  //parses the Url and stores it into a sky variable
    var bliss = await (Uri.parse("https://www.ncl.com/cms-service/cruise-ships/BLISS"));
    var escape = await (Uri.parse("https://www.ncl.com/cms-service/cruise-ships/ESCAPE"));

    final results = await Future.wait([ //store variables into a List so that all the parses are loaded at the same time
      http.get(sky),
      http.get(bliss),
      http.get(escape)
    ]);

    if(results.elementAt(0).statusCode == 200 && results.elementAt(1).statusCode == 200 && results.elementAt(2).statusCode == 200) {
      String data1 = results[0].body;
      String data2 = results[1].body;
      String data3 = results[2].body;

      final jsonString1 = convert.jsonDecode(data1);
      final jsonString2 = convert.jsonDecode(data2);
      final jsonString3 = convert.jsonDecode(data3);
      final shipModel1 = ShipModel.fromJson(jsonString1);
      final shipModel2 = ShipModel.fromJson(jsonString2);
      final shipModel3 = ShipModel.fromJson(jsonString3);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ShipScreen(shipModel1: shipModel1,shipModel2: shipModel2,shipModel3: shipModel3)), (route) => false);
    } else{
      for(int i = 0; results.elementAt(i).statusCode != 200; i++) {
        print(results.elementAt(i).statusCode);
      }
    }
  }

    @override
    void initState() {  //initializes state and gets the NCL function
      super.initState();
      getNCLData();
    }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator( //Nice little loading screen icon to notify user the UI is loading
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}