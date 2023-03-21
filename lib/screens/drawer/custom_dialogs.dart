import 'package:flutter/material.dart';
import 'package:returno/constants/colors_constant.dart';
import 'package:returno/utills/text_styles.dart';

import '../../constants/text_constanst.dart';
import '../onboarding/login_signup.dart';
import '../../utills/button.dart';
import '../../utills/navigation_rougth.dart';

class Dialog_Box extends StatefulWidget {
  const Dialog_Box({super.key});

  @override
  State<Dialog_Box> createState() => _Dialog_BoxState();
}

class _Dialog_BoxState extends State<Dialog_Box> {
  var h, w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Center(
        child: AlertDialog(
      contentPadding: EdgeInsets.all(0),
      backgroundColor: Colors.white,
      content: Container(
        margin: EdgeInsets.only(left: w * 0.04155, right: w * 0.04155),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: white,
        ),
        height: h * 0.1475,
        width: w * 0.83931,
        child: Column(
          children: [
            SizedBox(height: h * 0.025),
            custom_text_with_center(
                text: logut_contents,
                style: CustomStyle().style_16_reguler(black)),
            SizedBox(height: h * 0.03125),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: custom_text(
                        text: cancel,
                        style: CustomStyle().style_16_reguler(blue))),
                SizedBox(
                  height: h * 0.045,
                  child: custom_button(context, width: w * 0.35, onTap: () {
                    pushAndRevoveUntil(context, Login_Signup());
                  }, children: [
                    custom_text(
                        text: logout,
                        style: CustomStyle().style_16_reguler(white))
                  ], colors: [
                    buttonclr1,
                    buttonclr2
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
