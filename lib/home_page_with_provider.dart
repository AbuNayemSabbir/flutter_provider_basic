import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/font_size_provider.dart';
import 'package:provider_basic/provider/theme_provider.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key? key}) : super(key: key);

  @override
  State<MyHomePage1> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {


  @override
  Widget build(BuildContext context) {
    print(" print");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Text("TEXT",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                Consumer<FontSizeProvider>(
                  builder: (BuildContext context, fontSizeProvider,
                      Widget? child) {
                    return Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
                      , style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: fontSizeProvider.textSize,),);
                  },

                ),
                Consumer<FontSizeProvider>(
                  builder: (BuildContext context, fontSizeProvider,
                      Widget? child) {
                    return Slider(

                      inactiveColor: Colors.blue,
                      value: fontSizeProvider.textSize,
                      min: 10,
                      max: 30,
                      onChanged: (newValue) {
                        fontSizeProvider.setTextSize(newValue);
                      },
                    );
                  },

                ),
                ElevatedButton(onPressed: () {
                  showColorPicker(context);
                }, child: Text("Pick Color")),
                Consumer<ThemeProvider>(
                  builder: (BuildContext context, themeProvider,
                      Widget? child) {
                    return Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
                      , style: TextStyle(fontWeight: FontWeight.bold,
                        color: themeProvider.mainColor),);
                  },)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showColorPicker(BuildContext context) {
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          content: Consumer<ThemeProvider>(
            builder: (BuildContext context, themProvider, Widget? child) {
              return ColorPicker(pickerColor: themProvider.mainColor,
                  onColorChanged: (color) {
                    themProvider.changeThemeColor(color);
                  });
            },),
        )
    );
  }
}
