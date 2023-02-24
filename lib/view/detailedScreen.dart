import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedScreen extends StatefulWidget {
String title;
String detailed;
String image;
String releaseDate;
int duration;
  DetailedScreen({Key? key,required this.title,required this.detailed,required this.image,required this.releaseDate,required this.duration}) : super(key: key);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  Offset dragGesturePositon = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        title:   RichText(
          text: TextSpan( style: GoogleFonts.anton(
            color: Colors.white,
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
            children: <TextSpan>[
              const TextSpan(text: 'T I T L E  :  ',style: TextStyle(color: Colors.red,  fontSize: 20,)),
              TextSpan(text: widget.title!=null.toString()?widget.title:"Loading" ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Hero(
                  tag: 1,
                  child: Container(
                      child: widget.image.toString() != null.toString() ? CachedNetworkImage(
                        imageUrl: widget.image.toString(),
                        imageBuilder: (context, imageProvider) => Container(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                image: imageProvider, ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            Image.asset('assets/images.jpg',height: 500,width: 330,fit: BoxFit.fitHeight),)
                          : Image.asset('assets/images.jpg',height: 500,width: 330,fit: BoxFit.fitHeight)),
                        //routeArgs['imageUrl'],
                      ),
                    ),

              const SizedBox(
                height: 5,
              ),
              Stack(
                children: <Widget>[
                  GestureDetector(
                    onPanUpdate: (DragUpdateDetails details) => setState(
                          () {
                        dragGesturePositon = details.localPosition;
                      },
                    ),
                    child:   RichText(
                      text: TextSpan( style: GoogleFonts.oswald(
                        color: Colors.white,
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                        children: <TextSpan>[
                          const TextSpan(text: 'Descrition : ',style: TextStyle(color: Colors.red,  fontSize: 20,)),
                          TextSpan(text: widget.detailed, ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: dragGesturePositon.dx,
                    top: dragGesturePositon.dy,
                    child: const RawMagnifier(
                      decoration: MagnifierDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.pink, width: 3),
                        ),
                      ),
                      size: Size(100, 50),
                      magnificationScale: 1.5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Column(
                          children: <Widget>[
                            const Icon(
                              Icons.timer,
                              size: 45,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                widget.duration.toString()!=null.toString()? "${widget.duration} Min":"Loading",
                              style: const TextStyle(color:Colors.red,
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: <Widget>[
                            const Icon(
                              Icons.calendar_today,
                              size: 45,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.releaseDate!=null.toString()?widget.releaseDate:"Loading",
                              style: const TextStyle(color:Colors.red,
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: const <Widget>[
                           Icon(
                              Icons.star_border,
                              size: 45,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              // '$rating/10',
                              "9/10",
                              style: TextStyle(color:Colors.red,
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
