// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';
import '../../constants/text_constanst.dart';
import '../../navigation_services/navigator_key.dart';
import '../../utills/button.dart';
import '../../utills/custom_indicators.dart';
import '../../utills/navigation_rougth.dart';
import '../../utills/text_styles.dart';
import 'login_signup.dart';

class Tourial extends StatefulWidget {
  const Tourial({super.key});

  @override
  State<Tourial> createState() => _TourialState();
}

class _TourialState extends State<Tourial> {
  List page = [Tourial_one(), Tourial_two()];
  var pageController = PageController();
  int currentIndex = 0;
  var h1, w1;
  @override
  Widget build(BuildContext context) {
    h1 = MediaQuery.of(context).size.height;
    w1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundclr,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(left: w1 * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  page.length,
                  (index) => custom_circleAvatar(context,
                      backgroundColor:
                          currentIndex == index ? indicatorclr : white)),
            ),
          ),
          SizedBox(height: h1 * 0.035),
          Padding(
              padding:
                  EdgeInsets.only(left: w1 * 0.08587, bottom: h1 * 0.01875),
              child: custom_button(context,
                  colors: [buttonclr1, buttonclr2],
                  onTap: () {
                    if (currentIndex == 0) {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    } else if (currentIndex == 1) {
                      pushAndRevoveUntil(context, Login_Signup());
                    }
                  },
                  children: [
                    custom_text(
                        text: next,
                        style: CustomStyle().style_18_reguler(white)),
                  ]))
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: h1 * 1,
            width: w1 * 1,
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                scrollDirection: Axis.horizontal,
                itemCount: page.length,
                itemBuilder: (BuildContext context, int index) {
                  return page.elementAt(currentIndex);
                }),
          ),
          Padding(
            padding: EdgeInsets.only(right: w1 * 0.04155, top: h1 * 0.0575),
            child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: () {
                      replaceRoute(context, Login_Signup());
                    },
                    child: custom_text(
                        text: skip,
                        style: CustomStyle().style_16_bold(white)))),
          ),
        ],
      ),
    );
  }
}

class Tourial_one extends StatelessWidget {
  const Tourial_one({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundclr,
      body: Container(
          height: h * 1,
          width: w * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(tourialbackground), fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04155),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.7,
                ),
                custom_text_with_center(
                    text: tourialtext_one_1,
                    style: CustomStyle().style_22_bold(white)),
                SizedBox(
                  height: h * 0.0175,
                ),
                custom_text_with_center(
                    text: tourialtext_one_2,
                    style: CustomStyle().style_16_reguler(white))
              ],
            ),
          )),
    );
  }
}

class Tourial_two extends StatelessWidget {
  const Tourial_two({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundclr,
      body: Container(
          height: h * 1,
          width: w * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(tourialbackground), fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04155),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.7,
                ),
                custom_text_with_center(
                    text: tourialtext_two_1,
                    style: CustomStyle().style_22_bold(white)),
                SizedBox(
                  height: h * 0.0175,
                ),
                custom_text_with_center(
                    text: tourialtext_two_2,
                    style: CustomStyle().style_16_reguler(white))
              ],
            ),
          )),
    );
  }
}
