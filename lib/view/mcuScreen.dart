import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mcu_app/model/mcuModel.dart';
import 'package:mcu_app/view/detailedScreen.dart';
import 'dart:math' show pi;

class mcu extends StatefulWidget{
  mcu({Key? key}) : super(key: key);

  @override
  State<mcu> createState() => _mcuState();
}

class _mcuState extends State<mcu> with SingleTickerProviderStateMixin {

  AnimationController? _controller;
  Animation <double>? _animation;

  @override
  void initState(){
    super.initState();
    _controller=AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10,),);

    _animation=Tween<double>(
        begin:0.0,
    end: 2 * pi,).animate(_controller!);

    _controller!.repeat();
  }

  @override
  void dispose(){
    _controller!.dispose();
    super.dispose();
  }

  List<MCU_Comics> postList = [] ;

  Future<List<MCU_Comics>> getPostApi ()async{
    final resposne = await http.get(Uri.parse('https://mcuapi.herokuapp.com/api/v1/movies')) ;
    var data=jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){
      postList.clear();
      for(Map i in data['data']){
        postList.add(MCU_Comics.fromJson(i as Map<String,dynamic>));
      }
      return postList ;
    }else {
      return postList ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 245,
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context , snapshot){
                if(!snapshot.hasData){
                  return Center(child: Text('Loading'));
                }else {
                  return ListView.builder(
                      itemCount: postList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return  Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedScreen(
                                      image:postList[index]!.coverUrl.toString(),releaseDate: postList[index]!.releaseDate.toString(),
                                      title:postList[index]!.title.toString(),detailed: postList[index]!.overview.toString(),
                                      duration: postList[index]!.duration!,)));
                                  },
                                  child:  AnimatedBuilder(
                                    animation: _controller!,
                                    builder: (context,child){
                                      return Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.identity()..rotateY(_animation!.value),
                                      child:   Container(
                                          height: 220,
                                          width: 160,
                                          child: postList[index]!.coverUrl != null ? CachedNetworkImage(imageUrl:
                                          postList[index]!.coverUrl.toString(),
                                            placeholder: (context, url) =>
                                                Image.asset('assets/images.jpg',height: 220,  width: 160,fit: BoxFit.fitHeight),)
                                              : Image.asset('assets/images.jpg',height: 220,  width: 160,fit: BoxFit.fitHeight)),
                                        );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        );
                      });

                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
