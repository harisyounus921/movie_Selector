import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mcu_app/model/mcuModel.dart';
import 'package:mcu_app/model/trendingAllModel.dart';
import 'package:mcu_app/view/customAppBarScreen.dart';
import 'package:mcu_app/view/detailedScreen.dart';
import 'package:mcu_app/view/frontScreen.dart';
import 'package:mcu_app/view/mcuScreen.dart';
import 'package:mcu_app/view/trendingScreen.dart';
import 'package:provider/provider.dart';

import '../provider/scrollProvider.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {

  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController=ScrollController();
    _scrollController?.addListener(() {
      Provider.of<scrollProvider>(context,listen: false).setOffset(_scrollController!.offset);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
      appBar:PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,50.0),
        child: SafeArea(
          child: Consumer<scrollProvider>(
            builder: (context,scrollProvider,child){
              return CustomAppbar(scrolloffset: scrollProvider.scrollofset,);
            },
          ),
        ),
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const frontScreen(image: 'assets/long.jpg',title: 'assets/title.png',),
              const SizedBox(height: 5),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: SelectableText("   MCU Movies",style: TextStyle(fontSize:25,fontStyle: FontStyle.italic,color: Colors.white),),
              ),
              mcu(),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: SelectableText("   Trending Movies",style: TextStyle(fontSize:25,fontStyle: FontStyle.italic,color: Colors.white),),
              ),
              trendingMovie(),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: SelectableText("   Trending TV Shows",style: TextStyle(fontSize:25,fontStyle: FontStyle.italic,color: Colors.white),),
              ),
              trendingSeries(),

            ],
          ),
        ),
      )
    );
  }
}



