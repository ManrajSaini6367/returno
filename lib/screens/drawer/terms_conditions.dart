// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';

import '../../constants/text_constanst.dart';

import '../../utills/navigation_rougth.dart';
import '../../utills/text_styles.dart';
import '../homepage.dart';
import 'drawer_main_page.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
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
                    text: terms_and_conditions,
                    style: CustomStyle().style_18_medium(white)))),
        body: WebView(
          initialUrl: "https://flutter.dev/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
