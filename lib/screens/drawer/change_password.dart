// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:returno/utills/text_styles.dart';
import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';
import '../../constants/text_constanst.dart';
import '../../utills/button.dart';
import '../../utills/custom_text_fields.dart';
import '../../utills/navigation_rougth.dart';
import '../homepage.dart';
import 'drawer_main_page.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var password_controller = TextEditingController();
  var new_password_controller = TextEditingController();
  var confirm_password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return WillPopScope(
      onWillPop: () async {
        pushAndRevoveUntil(context, Homepage());
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer_page(),
        backgroundColor: backgroundclr,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(h * 0.078),
          child: AppBar(
              shadowColor: appbar_shadow,
              elevation: 7,
              centerTitle: true,
              leading: TextButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                child: SvgPicture.asset(menu_icon),
              ),
              title: custom_text(
                  text: change_password,
                  style: CustomStyle().style_18_medium(white))),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04155),
            child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: h * 0.025, bottom: h * 0.015),
                      child: custom_text(
                          text: current_password,
                          style: CustomStyle().style_16_medium(white)),
                    ),
                    custom_textformfield(context,
                      hintText: current_password,
                      suffixIcon: Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                      controller: password_controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter current password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: h * 0.0175, bottom: h * 0.015),
                      child: custom_text(
                          text: new_password,
                          style: CustomStyle().style_16_medium(white)),
                    ),
                    custom_textformfield(context,
                      hintText: new_password,
                      suffixIcon: Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                      controller: new_password_controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter new password';
                        } else if (value.length < 8) {
                          return 'Please enter minimum 8 charactors of password';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: h * 0.0175, bottom: h * 0.015),
                      child: custom_text(
                          text: confirm_password,
                          style: CustomStyle().style_16_medium(white)),
                    ),
                    custom_textformfield(context,
                      hintText: confirm_password,
                      suffixIcon: Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                      controller: confirm_password_controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter confirm password';
                        } else if (confirm_password_controller.text !=
                            new_password_controller.text) {
                          return 'Confirm password do`es not match!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: h * 0.05),
                    custom_button(context,
                        width: w * 1,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formkey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },
                        children: [
                          custom_text(
                              text: submit,
                              style: CustomStyle().style_18_reguler(white))
                        ],
                        colors: [
                          buttonclr1,
                          buttonclr2
                        ])
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
