import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcu_app/view/constant.dart';

class frontScreen extends StatelessWidget {
  final String image;
  final String title;
  const frontScreen({Key? key,required this.image,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image.toString()),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          height: 400,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black,Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250,
            child: Image.asset(title.toString()),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(icon:Icons.add, title:"List",
                  onTap:(){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar1);},),

                playButton(title: 'Play',icon: Icons.play_arrow,
                  onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar1);}, ),

                VerticalIconButton(icon:Icons.info_outline , title:"info",
                  onTap:(){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar1);},),
              ],
            ))
      ],
    );
  }
}

class playButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const playButton({Key? key,required this.title,required this.onTap,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed:onTap,
        style: TextButton.styleFrom(
            padding:// Responsive.isMoblie(context)?
            const EdgeInsets.fromLTRB(15, 5, 20, 5),
            //  const EdgeInsets.fromLTRB(25, 10, 30, 10),
            backgroundColor: Colors.white),
        icon: Icon(icon,size: 30.0,color: Colors.black,),
        label:Text(title,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black),));
  }
}

class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const VerticalIconButton({Key? key,required this.title,required this.onTap,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon,color: Colors.white,),
          const SizedBox(height: 2.0,),
          Text(title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }
}