import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController controller;
  final String? labelText;
  final Color? borderColor;
  final double thickness;
  final String hintText;
  final Color? hintColor;
  final double hint_fontSize;
  final double text_fontSize;
  final Color textColor;
  final double? contentPadding;
  final double? top_Padding;
  final double? bottom_Padding;
  final double? left_Padding;
  final double? right_Padding;

  const MyTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.borderColor = Colors.blue,
    this.thickness = 1.5,
    required this.hintText,
    this.hintColor = Colors.grey,
     this.hint_fontSize = 15,
    this.text_fontSize = 15,
    this.textColor =Colors.blue,
    this.contentPadding = 0, this.top_Padding = 0, this.bottom_Padding = 0, this.left_Padding = 0, this.right_Padding =0,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      style: TextStyle(color: textColor,fontSize: text_fontSize),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
         borderSide: BorderSide(
           color: borderColor!,
           width: thickness,)
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor,fontSize:hint_fontSize,),
        contentPadding:EdgeInsets.only(top: top_Padding!,left: left_Padding!,bottom: bottom_Padding!,right: right_Padding!)
      ),
    );
  }
}
