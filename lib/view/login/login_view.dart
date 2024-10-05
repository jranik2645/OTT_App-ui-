import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ott_photo_play/common_widget/round_button.dart';
import 'package:ott_photo_play/view/login/register_view.dart';
import 'package:ott_photo_play/view/main_tab/main_tab_view.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_text_field.dart';
import 'forgot_password.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: media.width,
            height: media.width,
            child: ClipRect(
              child: Transform.scale(
                scale: 1.3,
                child: Image.asset(
                  "assets/img/login_top.png",
                  width: media.width,
                  height: media.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: media.width,
            height: media.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                TColor.bg.withOpacity(0),
                TColor.bg.withOpacity(0),
                TColor.bg
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: media.width * 0.10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.75,
                    alignment: const Alignment(0, 0.5),
                    child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          color:
                              TColor.tModeDark ? Colors.transparent : TColor.bg,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: TColor.tModeDark
                              ? null
                              : [
                                  const BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 4),
                                  )
                                ]),
                      child: Image.asset(
                        "assets/img/app_logo.png",
                        width: media.width * 0.35,
                        height: media.width * 0.35,
                      ),
                    ),
                  ),
                  RoundTextField(
                    controller: textEmail,
                    title: 'EMAIL',
                    hintText: 'email here',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    controller: textPassword,
                    title: 'PASSWORD',
                    obSecureText: true,
                    hintText: 'password here',
                    keyboardType: TextInputType.visiblePassword,
                    right: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordView() ));
                      },
                      child: Text(
                        "FORGOT?",
                        style: TextStyle(
                          color: TColor.text,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>  MainTabView()));},
                    title: "LOGIN",
                  ),
                    SizedBox(height: 20,),
                     Row(
                       children: [
                         Expanded(child: Container(
                            height: 1,
                            color: TColor.subtext,
                         )),
                         Padding(
                             padding: EdgeInsets.symmetric(horizontal: 8.0,),
                               child:Text(
                               "Social Logins",
                                 style: TextStyle(
                                   color: TColor.text,
                                   fontSize: 14,
                                   fontWeight: FontWeight.w700,
                                 ),
                         )  ,

                         ),
                         Expanded(child: Container(
                           height: 1,
                           color: TColor.subtext,
                         )),
                       ],
                     ),
                  SizedBox(height: 25,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         IconButton(onPressed: (){},
                             icon:Image.asset("assets/img/fb_btn.png",
                               width: 45,
                                height: 45,
                             )),
                     SizedBox(width: 10,),
                        IconButton(onPressed: (){},
                            icon:Image.asset("assets/img/google_btn.png",
                              width: 45,
                              height: 45,
                            )),
                      ],
                   ),
                   SizedBox(height: 30,),
                   Text("Don't have an account",
                    style: TextStyle(color: TColor.subtext,fontSize: 14,
                     fontWeight: FontWeight.w400),

                   ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView() ));
                    },
                        child: Text(
                           "REGISTER",
                          style: TextStyle(
                             color: TColor.text,
                             fontSize: 16,
                             fontWeight: FontWeight.w700,
                          ),
                        ))

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
