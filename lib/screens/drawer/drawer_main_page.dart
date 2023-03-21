// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:returno/screens/drawer/about_page.dart';
import 'package:returno/screens/drawer/privacy_polocy.dart';
import 'package:returno/screens/drawer/profile.dart';
import 'package:returno/screens/drawer/terms_conditions.dart';
import 'package:returno/utills/button.dart';
import 'package:returno/utills/custom_listtile.dart';
import 'package:returno/utills/navigation_rougth.dart';
import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';

import '../../constants/text_constanst.dart';
import 'custom_dialogs.dart';
import '../../utills/text_styles.dart';
import '../homepage.dart';
import 'change_password.dart';
import 'favorites.dart';

class Drawer_page extends StatefulWidget {
  const Drawer_page({super.key});

  @override
  State<Drawer_page> createState() => _Drawer_pageState();
}

class _Drawer_pageState extends State<Drawer_page> {
  @override
  Widget build(BuildContext context) {
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.75,
      color: transparent,
      child: Stack(
        children: [
          Container(
            color: black,
            height: h * 1,
            width: w * 0.7,
            padding: EdgeInsets.symmetric(horizontal: w * 0.03),
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.051),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child:
                              SvgPicture.asset(drawer_logo, height: h * 0.07)),
                      SizedBox(height: h * 0.05),
                      custom_list_tile(context,() {
                        Navigator.pop(context);

                        pushAndRevoveUntil(context, Homepage());
                      },
                          Icon(
                            Icons.home,
                            color: white,
                            size: h * 0.028,
                          ),
                          home),
                      custom_list_tile(context,() {
                        Navigator.pop(context);
                        push_to(context, Profile());
                      },
                          Icon(
                            Icons.person,
                            color: white,
                            size: h * 0.028,
                          ),
                          profile),
                      custom_list_tile(context,() {
                        Navigator.pop(context);
                        push_to(context, Favorites());
                      },
                          Image.asset(favorite_icon,
                              color: white, height: h * 0.024),
                          favorites),
                      custom_list_tile(context,() {
                        Navigator.pop(context);
                        push_to(context, TermsConditions());
                      },
                          Image.asset(terms_conditons_icon,
                              color: white, height: h * 0.025),
                          terms_conditions),
                      custom_list_tile(context,() {
                        Navigator.pop(context);
                        push_to(context, PrivacyPolocy());
                      },
                          Icon(
                            Icons.verified_user,
                            color: white,
                            size: h * 0.0265,
                          ),
                          privacy_polcy),
                      custom_list_tile(context,() {
                        Navigator.pop(context);
                        push_to(context, AboutApp());
                      },
                          Image.asset(about_icon,
                              color: white, height: h * 0.028),
                          about_app),
                      custom_list_tile(context,() {
                        Navigator.pop(context);
                        push_to(context, ChangePassword());
                      },
                          Image.asset(change_password_icon,
                              color: white, height: h * 0.023),
                          change_password),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: h * 0.0375),
                    child: custom_button(context,
                        onTap: () {
                           showDialog(
                                context: context,
                                builder: (context) => Dialog_Box(),
                              );
                        },
                        children: [
                          SvgPicture.asset(logout_icon),
                          SizedBox(width: w * 0.0277),
                          custom_text(
                              text: logout,
                              style: CustomStyle().style_18_reguler(white))
                        ],
                        colors: [
                          buttonclr1,
                          buttonclr2
                        ]),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.067, left: w*0.65787),
              child: Image.asset(clear_icon, height: h * 0.0365),
            ),
          ),
        ],
      ),
    );
  }
}
