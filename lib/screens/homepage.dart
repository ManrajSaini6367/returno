// ignore_for_file: unused_local_variable, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:returno/utills/text_styles.dart';
import '../constants/colors_constant.dart';
import '../constants/image_constants.dart';

import '../constants/text_constanst.dart';
import 'drawer/drawer_main_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  bool _isFavorite = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool like = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: backgroundclr,
      key: scaffoldKey,
      drawer: Drawer_page(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.001),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: h * 0.95,
              child: RefreshIndicator(
                displacement: h * 0.1,
                color: Colors.blue,
                onRefresh: () async {
                  await Future.delayed(Duration(milliseconds: 65 - 0));
                },
                child: Center(
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScroll) {
                    overScroll.disallowGlow();
                    return false;
                  },
                  child: PageView.builder(
                    padEnds: true,
                    allowImplicitScrolling: true,
                    itemCount: 50,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: h * 0.095,
                        width: w * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: h * 0.3,
                              width: w * 1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(backgroung_home),
                                      fit: BoxFit.fill)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          right: w * 0.0277, top: h * 0.0125),
                                      child: CircleAvatar(
                                          radius: 19,
                                          backgroundColor:
                                              black.withOpacity(0.5),
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _isFavorite = !_isFavorite;
                                              });
                                              _controller.reverse().then(
                                                  (value) =>
                                                      _controller.forward());
                                            },
                                            child: ScaleTransition(
                                                scale: Tween(
                                                        begin: 0.7, end: 1.0)
                                                    .animate(CurvedAnimation(
                                                        parent: _controller,
                                                        curve: Curves.easeOut)),
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(9),
                                                    child: Image.asset(
                                                      favorite_icon,
                                                      color: _isFavorite
                                                          ? red
                                                          : white,
                                                    ))),
                                          )))
                                ],
                              ),
                            ),
                            SizedBox(height: h * 0.018),
                            custom_text(
                                text: lorem_ipsum_text,
                                style: CustomStyle().style_18_medium(white)),
                            SizedBox(height: h * 0.008),
                            custom_text(
                                text: lerm_ipsum_sub_text,
                                style: GoogleFonts.roboto(
                                    height: h * 0.0015,
                                    fontSize: w * 0.04709,
                                    color: white,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: h * 0.008),
                            custom_text(
                                text: lorem_2_sub_text,
                                style: CustomStyle().style_12_reguler(grey)),
                          ],
                        ),
                      );
                    },
                  ),
                )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: w * 0.0277, top: h * 0.0125),
            child: InkWell(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: SvgPicture.asset(menu_icon),
            ),
          )
        ],
      ),
    );
  }
}
