// ignore_for_file: camel_case_types, prefer_const_constructors, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:returno/constants/colors_constant.dart';
import 'package:returno/constants/text_constanst.dart';
import 'package:returno/screens/onboarding/login_signup.dart';
import 'package:returno/utills/button.dart';
import 'package:returno/utills/email_validation.dart';
import 'package:returno/utills/text_styles.dart';
import '../../utills/custom_text_fields.dart';
import '../../utills/navigation_rougth.dart';

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  final globalKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: back_icon(context),
        elevation: 0,
      ),
      backgroundColor: backgroundclr,
      body: Form(
        key: globalKey,
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.04155, right: w * 0.04155),
          child: Column(children: [
            SizedBox(height: h * 0.035),
            custom_text_with_center(
                text: forgot_password,
                style: CustomStyle().style_22_medium(white)),
            SizedBox(height: w * 0.02),
            custom_text_with_center(
                text: suggestion,
                style: CustomStyle().style_16_reguler(black50)),
            SizedBox(height: h * 0.075),
            custom_textformfield(context,
              hintText: email,
              suffixIcon: Icon(
                Icons.clear,
                color: Colors.transparent,
              ),
              controller: emailcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter email';
                } else if (!emailPattern
                    .hasMatch(emailcontroller.text.toString())) {
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
            SizedBox(height: h * 0.05),
            custom_button(context,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (globalKey.currentState!.validate()) {
                    replaceRoute(context, Login_Signup());
                  }
                },
                children: [
                  custom_text(
                      text: forgot_password,
                      style: CustomStyle().style_18_reguler(white)),
                ],
                colors: [
                  buttonclr1,
                  buttonclr2
                ]),
            SizedBox(height: h * 0.035),
            custom_text_with_center(
                text: suggestion_forgot,
                style: CustomStyle().style_16_medium(white70))
          ]),
        ),
      ),
    );
  }
}
