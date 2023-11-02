import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const MyText({super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 23,
    this.fontWeight = FontWeight.w700
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize:fontSize,fontWeight: fontWeight),);
  }
}
