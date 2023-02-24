import 'package:flutter/material.dart';
import 'package:mcu_app/view/constant.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key,required this.scrolloffset}) : super(key: key);
  final double scrolloffset;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24.0,),
      color: Colors.black.withOpacity((scrolloffset/350).clamp(0,1).toDouble()),
      child: Row(
        children: [
          Image.asset('assets/logo.png'),
          const SizedBox(width: 12.0,),
          Expanded(
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppbarButton(title: "MCU ", onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar1);}),
                _AppbarButton(title: "Trending", onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar1);}),
                _AppbarButton(title: "TV Shows", onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar1);}),
              ],),),],
      ),
    );
  }
}

class _AppbarButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  _AppbarButton({required this.title,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Text(title ,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),),
      );
  }
}