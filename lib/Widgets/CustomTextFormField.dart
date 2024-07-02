import 'package:flutter/material.dart';

class Customtextformfield extends StatefulWidget {
  String? Function(String?)? validate;
  bool isPassword;
  String label;
  TextEditingController controller;

  TextInputType? inputType;
  Customtextformfield({this.validate,required this.isPassword,required this.label,required this.controller,this.inputType});

  @override
  State<Customtextformfield> createState() => _CustomtextformfieldState();
}

class _CustomtextformfieldState extends State<Customtextformfield> {
  bool isShow=true;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: TextFormField(
        keyboardType: widget.inputType==null?TextInputType.name:widget.inputType,
       controller: widget.controller,
        obscureText: widget.isPassword==true?isShow:widget.isPassword,
        validator: widget.validate,
       decoration: InputDecoration(
           suffixIconConstraints: BoxConstraints(
             minHeight: 20,
             minWidth: 20,
           ),

         suffix: widget.isPassword==true?
         IconButton(iconSize: 20, onPressed: (){}, icon: isShow==true?
         IconButton(onPressed: (){
           setState(() {
             print(isShow);
             isShow=false;
           });
         }, icon: Icon(Icons.visibility_off)):
         IconButton(onPressed: (){
           setState(() {
             print(isShow);
             isShow=true;
           });
         }, icon: Icon(Icons.visibility))
         )
          :SizedBox() ,
         floatingLabelBehavior: FloatingLabelBehavior.never,
         label: Text(widget.label),
         border: OutlineInputBorder(
         )
       ),
      ),
    );
  }
}
