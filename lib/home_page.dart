import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double textSize=10;
  @override
  Widget build(BuildContext context) {
    print(" print");
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body:  Center(
        child:SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text("TEXT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                Text( 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
                  ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: textSize),),
                Slider(

                  inactiveColor: Colors.blue,
                  value: textSize,
                  min: 10, // Use the constants here
                  max: 30, // Use the constants here
                  onChanged: (newValue) {
                    setState(() {
                      textSize=newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
