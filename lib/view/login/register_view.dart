import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ott_photo_play/common_widget/round_button.dart';
import 'package:ott_photo_play/view/login/forgot_password.dart';
import 'package:ott_photo_play/view/login/register_view.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  TextEditingController textFirstName = TextEditingController();
  TextEditingController textLastName = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  TextEditingController textConfirmPassword = TextEditingController();

  final ImagePicker picker = ImagePicker();
   XFile? image;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
           leadingWidth: 100,
            leading: InkWell(
                 onTap: (){
                   Navigator.pop(context);
                 },
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                 child: Row(
                     mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/img/back_btn.png",
                        width: 13,
                        height: 13,
                         color: TColor.subtext,
                      ),
                       SizedBox(width: 8,),
                      Text(
                         "BACK",
                        style: TextStyle(
                           color: TColor.subtext,
                           fontSize: 14,
                           fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                 ),
              )
            ),
        ),



      backgroundColor: TColor.bg,
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColor.primary1,
        onPressed: () {
          TColor.tModeDark = !TColor.tModeDark;
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          TColor.tModeDark ? Icons.light_mode : Icons.dark_mode,
          color: TColor.text,
        ),
      ),
      body:
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: media.width * 0.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                         InkWell(
                            onTap: ()async{
                           image = await picker.pickImage(source: ImageSource.gallery);
                            setState(() {

                            });
                            },
                           child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color:TColor.card,

                                borderRadius: BorderRadius.circular(media.width* 0.15),
                                boxShadow:const[
                                   BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 4),
                                  )
                                ]),
                            child: image !=null?

                            ClipRRect(
                                   borderRadius:
                                BorderRadius.circular(media.width * 0.15),
                               child: Image.file(File(image!.path),
                                 width: media.width * 0.18,
                                 height: media.width * 0.18,
                               ),

                            )
                             : ClipRRect(
                              borderRadius:
                              BorderRadius.circular(media.width * 0.15),
                                child: Image.asset(
                                  "assets/img/user_placeholder.png",
                                  width: media.width * 0.18,
                                  height: media.width * 0.18,
                                  fit: BoxFit.cover,
                                ),
                              ),

                                                   ),
                         ),
                      SizedBox(height: 10,),
                      Text(
                        "Add profile picture",
                        style: TextStyle(
                          color: TColor.subtext,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,),
                  RoundTextField(
                    controller: textEmail,
                    title: 'FIRST NAME',
                    hintText: 'first name here',
                  ),
                  SizedBox(
                    height: 20,),
                  RoundTextField(
                    title: 'LAST NAME',
                    hintText: 'last name is here',

                  ),

                  SizedBox(
                    height: 20,),
                  RoundTextField(
                    controller: textEmail,
                    title: 'EMAIL',
                    hintText: 'email here',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,),
                  RoundTextField(
                    controller: textPassword,
                    title: 'PASSWORD',
                    obSecureText: true,
                    hintText: 'password here',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    controller: textPassword,
                    title: 'CONFIRM PASSWORD',
                    obSecureText: true,
                    hintText: 'password here',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  RoundButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordView()));
                    },
                    title: "REGISTER",
                  ),
                  SizedBox(height: 20,),



                ],
              ),
            ),
          ),

    );
  }
}
