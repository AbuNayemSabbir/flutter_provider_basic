import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/provider/font_size_provider.dart';
import 'package:provider_basic/provider/theme_provider.dart';

import 'home_page_with_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //todo singleProvider
  @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider<FontSizeProvider>(
  //     create: (BuildContext context) {
  //       return FontSizeProvider();
  //     },
  //     child: MaterialApp(
  //       title: 'Flutter Demo',
  //       theme: ThemeData(
  //          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //         useMaterial3: true,
  //       ),
  //       home:  const MyHomePage1(),
  //     ),
  //   );
  // }
  //todo multi-provider
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FontSizeProvider>(
            create: (BuildContext context) {
          return FontSizeProvider();
        }),
        ChangeNotifierProvider<ThemeProvider>(
            create: (BuildContext context) {
          return ThemeProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage1(),
      ),
    );
  }
}
