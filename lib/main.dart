import 'package:flutter/material.dart';
import 'package:mcu_app/provider/scrollProvider.dart';
import 'package:mcu_app/view/mainScreen.dart';
import 'package:mcu_app/view/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home:Splashscreen(),
    );
  }
}
