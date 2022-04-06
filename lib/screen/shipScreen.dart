import 'package:flutter/material.dart';
import 'package:ncl/model/shipModel.dart';

class ShipScreen extends StatefulWidget {
  ShipModel shipModel1;
  ShipModel shipModel2;
  ShipModel shipModel3;
  ShipScreen({Key? key, required this.shipModel1, required this.shipModel2, required this.shipModel3}) : super(key: key); //Here we get all the required shipModels

  @override
  State<ShipScreen> createState() => _ShipScreenState();
}

class _ShipScreenState extends State<ShipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Norwegian Cruise Line Project'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(onPressed: (){
                  showDialog(context: context, builder: (context) => AlertDialog(title: Text('Sky Information'),
                    content:
                    Text('Ship Name: ${widget.shipModel1.shipName}\n'   //Here we get the shipModel1 or sky's response.body data.
                        'Ship Inaugural Date: ${widget.shipModel1.shipFacts.inauguralDate}\n'
                        'Ship Crew Size: ${widget.shipModel1.shipFacts.crew}\n'
                        'Ship Passenger Capacity: ${widget.shipModel1.shipFacts.passengerCapacity}'),
                    actions: [
                      TextButton(
                        child: Text('OK'), //Button to leave alert dialog box
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ));
              },
                  child: Text("SKY"),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )
                ),//Button
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(onPressed: (){
                showDialog(context: context, builder: (context) => AlertDialog(title: Text('Bliss Information'),
                  content:
                  Text('Ship Name: ${widget.shipModel2.shipName}\n'
                      'Ship Inaugural Date: ${widget.shipModel2.shipFacts.inauguralDate}\n'
                      'Ship Crew Size: ${widget.shipModel2.shipFacts.crew}\n'
                      'Ship Passenger Capacity: ${widget.shipModel2.shipFacts.passengerCapacity}'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ));
              },
                  child: Text("BLISS"),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(onPressed: (){
                showDialog(context: context, builder: (context) => AlertDialog(title: Text('Escape Information'),
                  content:
                  Text('Ship Name: ${widget.shipModel3.shipName}\n'
                      'Ship Inaugural Date: ${widget.shipModel3.shipFacts.inauguralDate}\n'
                      'Ship Crew Size: ${widget.shipModel3.shipFacts.crew}\n'
                      'Ship Passenger Capacity: ${widget.shipModel3.shipFacts.passengerCapacity}'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ));
              },
                  child: Text("ESCAPE"),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100,50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
