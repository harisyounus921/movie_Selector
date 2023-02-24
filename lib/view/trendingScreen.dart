import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mcu_app/model/trendingAllModel.dart';
import 'package:mcu_app/view/detailedScreen.dart';

class trendingMovie extends StatefulWidget {
  trendingMovie({Key? key}) : super(key: key);

  @override
  State<trendingMovie> createState() => _trendingMovieState();
}

class _trendingMovieState extends State<trendingMovie> with SingleTickerProviderStateMixin{
  String movieurl="https://image.tmdb.org/t/p/original/";
  AnimationController? _controller;
  Animation? _animation;

  @override
  void initState(){
  super.initState();
  _controller=AnimationController(
    vsync: this,
    duration: Duration(seconds: 10),);

  _animation=Tween<double>(
    begin: 0.0,
    end: 2 * pi ,
  ).animate(_controller!);

  _controller!.repeat();
  }

  @override
  void dispose(){
    _controller!.dispose();
    super.dispose();
  }

  List<TrendingAll> postList = [] ;

  Future<List<TrendingAll>> getPostApi ()async{
    final resposne = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/movie/day?api_key=ffa8aafab8854c9504c8bc1b3a5ebdb4')) ;
    var data=jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){
      postList.clear();
      for(Map i in data['results']){
        postList.add(TrendingAll.fromJson(i as Map<String,dynamic>));
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
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedScreen(
                                    image:movieurl+postList[index]!.posterPath.toString(),releaseDate: postList[index]!.releaseDate.toString(),
                                    title:postList[index]!.title.toString(),detailed: postList[index]!.overview.toString(),
                                    duration: postList[index]!.voteAverage!.toInt(),)));
                                },
                                child:AnimatedBuilder(
                                  animation: _controller!,
                                  builder: (context,child){
                                    return Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.identity()..rotateY(_animation!.value),
                                    child: Container(
                                        height: 220,
                                        width: 160,
                                        child: postList[index].posterPath.toString() != null ? CachedNetworkImage(imageUrl:
                                        movieurl+postList[index]!.posterPath.toString(),
                                          placeholder: (context, url) =>
                                              Image.asset('assets/images.jpg',height: 220,  width: 160,fit: BoxFit.fitHeight),)
                                            : Image.asset('assets/images.jpg',height: 220,  width: 160,fit: BoxFit.fitHeight,)),
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

class trendingSeries extends StatefulWidget {
  trendingSeries({Key? key}) : super(key: key);

  @override
  State<trendingSeries> createState() => _trendingSeriesState();
}

class _trendingSeriesState extends State<trendingSeries> with SingleTickerProviderStateMixin{
  String movieurl="https://image.tmdb.org/t/p/original/";
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState(){
    super.initState();

    _controller=AnimationController(
        vsync: this,
    duration: const Duration(seconds: 10));

    _animation=Tween<double>(
      begin: 0.0,
      end: 2 * pi ,
    ).animate(_controller!);

    _controller!.repeat();
  }

  @override
  void dispose(){
    _controller!.dispose();
    super.dispose();
  }
  List<TrendingAll> postList = [] ;

  Future<List<TrendingAll>> getPostApi ()async{
    final resposne = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/tv/day?api_key=ffa8aafab8854c9504c8bc1b3a5ebdb4')) ;
    var data=jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){
      postList.clear();
      for(Map i in data['results']){
        postList.add(TrendingAll.fromJson(i as Map<String,dynamic>));
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
                                    image:movieurl+postList[index]!.posterPath.toString(),releaseDate: postList[index]!.releaseDate.toString(),
                                    title:postList[index]!.title.toString(),detailed: postList[index]!.overview.toString(),
                                    duration: postList[index]!.voteAverage!.toInt(),)));
                                },
                                child:AnimatedBuilder(
                                  animation: _controller!,
                                  builder: (context,child){
                                    return Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()..rotateY(_animation!.value),
                                    child: Container(
                                        height: 220,
                                        width: 160,
                                        child:postList[index].posterPath.toString() != null ? CachedNetworkImage(imageUrl:
                                        movieurl+postList[index]!.posterPath.toString(),
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