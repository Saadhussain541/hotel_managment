import 'package:flutter/material.dart';
class SizeGap extends StatelessWidget {
  double? height;
  double? width;
  SizeGap({this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height==null?0:this.height,
      width: width==null?0:this.width,
    );
  }
}
