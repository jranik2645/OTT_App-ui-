
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RoundTextField extends StatelessWidget {

   final TextEditingController? controller;
   final String? hintText;
   final String  title;
   final TextInputType? keyboardType;
    final bool obSecureText;
    final Widget? left;
    final Widget? right;



  const RoundTextField({super.key, this.controller, this.hintText, required this.title, this.keyboardType, this.obSecureText=false, this.right, this.left});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
              style: TextStyle(
                color: TColor.text,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              )
          ),
          SizedBox(height: 8,),

          Container(
           // height: 45,
            decoration: BoxDecoration(
                color: TColor.card,
                borderRadius: BorderRadius.circular(9),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                   left ?? SizedBox(),
                 Expanded(
                   child: TextField(
                     controller: controller,
                     obscureText: obSecureText,
                     autocorrect: false,
                     keyboardType: keyboardType,
                     decoration: InputDecoration(
                       contentPadding:
                       EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                       enabledBorder: InputBorder.none,
                       focusedBorder: InputBorder.none,
                       hintText: hintText,

                       hintStyle: TextStyle(color: TColor.subtext,
                         fontSize: 17,
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                   ),
                 ),
                 right ??SizedBox(),

               ],
             
            ),
          ),

        ],
    );
  }

}