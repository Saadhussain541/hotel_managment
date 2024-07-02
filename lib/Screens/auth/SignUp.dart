import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/Widgets/CustomTextFormField.dart';
import 'package:image/Widgets/Custom_Button.dart';
import 'package:image/Widgets/SizeGap.dart';
import 'package:image_picker/image_picker.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? selectImage;
  Uint8List? webImage;
  final name=TextEditingController();
  final gender=TextEditingController();
  final email=TextEditingController();
  final phone=TextEditingController();
  final password=TextEditingController();
  final cpassword=TextEditingController();



  @override
  Widget build(BuildContext context) {

    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight*0.03,horizontal: screenWidth*0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: ()async{
                        if(kIsWeb)
                          {
                            XFile? pickImage=await ImagePicker().pickImage(source: ImageSource.gallery);
                            if(pickImage!=null)
                              {
                                var convertedImage=await pickImage.readAsBytes();
                                setState(() {
                                  webImage=convertedImage;
                                });
                              }
                          }
                        else {
                          XFile? pickImage = await ImagePicker().pickImage(
                              source: ImageSource.gallery);
                          if(pickImage!=null)
                            {
                              File convertedFile=File(pickImage.path);
                              setState(() {
                                selectImage=convertedFile;
                              });
                            }
                        }
                      },
                      child: kIsWeb?CircleAvatar(
                        radius: 100,
                        backgroundImage: webImage!=null?MemoryImage(webImage!):null,
                      ):CircleAvatar(
                        radius: 100,
                        backgroundImage: selectImage!=null?FileImage(selectImage!):null,)),

                  SizeGap(
                    height: screenHeight*0.02,
                  ),
                  Form(child: Column(
                    children: [
                     Customtextformfield(
                       controller: name,
                       isPassword: false,
                       label: 'Name',
                     ),
                      SizeGap(
                        height: screenHeight*0.01,
                      ),
                      Customtextformfield(
                        controller: name,
                        isPassword: false,
                        label: 'Age',
                        inputType: TextInputType.number,
                      ),
                      SizeGap(
                        height: screenHeight*0.01,
                      ),
                      Customtextformfield(
                        controller: email,
                        isPassword: false,
                        label: 'Email',
                      ),
                      SizeGap(
                        height: screenHeight*0.01,
                      ),
                      Customtextformfield(
                        controller: phone,
                        isPassword: false,
                        label: 'Phone',
                        inputType: TextInputType.number,
                      ),
                      SizeGap(
                        height: screenHeight*0.01,
                      ),
                      Customtextformfield(
                        controller: password,
                        isPassword: true,
                        label: 'Password',
                      ),
                      SizeGap(
                        height: screenHeight*0.01,
                      ),
                      Customtextformfield(
                        controller: cpassword,
                        isPassword: true,
                        label: 'Confirm Password',
                      ),
                      SizeGap(
                        height: screenHeight*0.02,
                      ),
                      CustomButton(
                        height: screenHeight*0.05,

                          text: 'Register', onpressed: (){}),
                      SizedBox(height: screenHeight*0.02,),
                      CustomButton(
                          height: screenHeight*0.05,
                          isBorder: true,
                          text: 'Back to Login', onpressed: (){})

                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
