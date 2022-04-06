import 'package:flutter/material.dart';
import 'package:ncl/model/shipModel.dart';
import 'package:ncl/shipScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

// enum Ship{
//   sky,
//   bliss,
//   escape
// }

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
    @override
  void initState() {
    super.initState();
    getNCLData();
  }


    Future<void> getNCLData() async {
    var sky = await (Uri.parse("https://www.ncl.com/cms-service/cruise-ships/SKY"));
    http.Response response1 = await http.get(sky);

    var bliss = await (Uri.parse("https://www.ncl.com/cms-service/cruise-ships/BLISS"));
    http.Response response2 = await http.get(bliss);

    var escape = await (Uri.parse("https://www.ncl.com/cms-service/cruise-ships/ESCAPE"));
    http.Response response3 = await http.get(escape);

    final results = await Future.wait([
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

    }else{
      print(response1.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}