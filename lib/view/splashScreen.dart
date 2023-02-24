import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcu_app/provider/scrollProvider.dart';
import 'package:mcu_app/view/mainScreen.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   login();
  }
  void login()async{
    Timer(const Duration(seconds: 4), (){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context)=>  MultiProvider(
            providers: [ChangeNotifierProvider(create: (_)=>scrollProvider())],
            child: Builder(builder: (BuildContext context) {
              return mainscreen();
            },),
          ), ),(route)=>false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,//double.infinity,
            width: double.infinity,
            child: const Image(
              //height: double.infinity,fit: BoxFit.fitHeight,
              image: AssetImage("assets/logo.png"),
              //fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10,),
          Text("Movies selector",style: GoogleFonts.oswald(
            color: Colors.redAccent,
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),)
        ],
      ),
    );
  }
}

