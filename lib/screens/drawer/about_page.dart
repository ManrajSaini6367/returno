// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:returno/utills/text_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';

import '../../constants/text_constanst.dart';

import '../../utills/navigation_rougth.dart';
import '../homepage.dart';
import 'drawer_main_page.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
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
                  text: about_app,
                  style: CustomStyle().style_18_medium(white))),
        ),
        body: WebView(
          initialUrl: "https://pub.dev/packages/webview_flutter",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
