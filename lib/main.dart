import 'package:flutter/material.dart';
import 'package:ncl/model/shipModel.dart';
import 'package:ncl/shipScreen.dart';
import 'package:ncl/loadingScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
//
// class DataFromNCL extends StatefulWidget {
//   const DataFromNCL({Key? key}) : super(key: key);
//
//   @override
//   State<DataFromNCL> createState() => _DataFromNCLState();
// }
//
// class _DataFromNCLState extends State<DataFromNCL> {
//
//   Future<void> getNCLData() async {
//     var sky = await (Uri.parse("https://www.ncl.com/cms-service/cruise-ships/SKY"));
//     http.Response response = await http.get(sky);
//
//
//     if(response.statusCode == 200) {
//       String data = response.body;
//
//       final jsonString = convert.jsonDecode(data);
//       final shipModel = ShipModel.fromJson(jsonString);
//
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => shipScreen(ShipModel: shipModel)), (route) => false);
//
//       // var shipName = convert.jsonDecode(data)['shipName']; //we get the ship name by using square brackets and can access more using more square brackets
//       // var shipFactsPassengerCapacity = convert.jsonDecode(data)['shipFacts']['passengerCapacity'];
//       // var shipFactsCrew = convert.jsonDecode(data)['shipFacts']['crew'];
//       // var shipFactsInauguralDate = convert.jsonDecode(data)['shipFacts']['inauguralDate'];
//       // print(shipName);
//       // print(shipFactsPassengerCapacity);
//       // print(shipFactsCrew);
//       // print(shipFactsInauguralDate);
//     }else{
//       print(response.statusCode);
//     }
//
//     // Response sky = await get(Uri.parse('https://www.ncl.com/cms-service/cruise-ships/SKY'));
//     // print(sky.body);
//     // Response bliss = await get(Uri.parse("https://www.ncl.com/cms-service/cruise-ships/BLISS"));
//     // print(bliss.body);
//     // Response escape = await get(Uri.parse("https://www.ncl.com/cms-service/cruise-ships/ESCAPE"));
//     // print(escape.body);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getNCLData();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NCL Project'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(onPressed: null, child: Text("SKY")),
//             ElevatedButton(onPressed: null, child: Text("BLISS")),
//             ElevatedButton(onPressed: null, child: Text("ESCAPE")),
//           ],
//         ),
//       ),
//     );
//   }
// }
