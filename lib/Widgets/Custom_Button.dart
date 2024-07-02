import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  double? width;
  double? height;

  VoidCallback onpressed;
  bool? isBorder;
  String text;
  CustomButton({required this.text,required this.onpressed,this.width,this.height,this.isBorder});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,

      child: Container(
        height: this.height,
        width: width==null?double.infinity:this.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isBorder==null?Colors.black:Colors.white,
          border: Border.all(
            color: isBorder==null?Colors.transparent:Colors.black
          )
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            color: isBorder==null?Colors.white:Colors.black,
            fontSize: 18
          ),),
        ),

      ),
    );
  }
}
