// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:returno/utills/text_styles.dart';
import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';
import '../../constants/text_constanst.dart';

import '../../utills/navigation_rougth.dart';
import '../homepage.dart';
import 'drawer_main_page.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites>
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
    return WillPopScope(onWillPop: () async {
         pushAndRevoveUntil(context, Homepage());
        return false;
      },
      child: Scaffold( key: scaffoldKey,
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
                  text: favorites, style: CustomStyle().style_18_medium(white)),
            )),
        body: ListView.builder(
          itemCount: 10,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                  left: w * 0.04155,
                  right: w * 0.04155,
                  bottom: h * 0.0125,
                  top: h * 0.022),
              decoration: BoxDecoration(
                  color: backgroundclr,
                  boxShadow: [
                    BoxShadow(
                      color: white.withOpacity(0.05),
                      blurRadius: 12,
                    )
                  ],
                  borderRadius: BorderRadius.circular(9)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.42,
                    width: w * 1,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(9),
                            topLeft: Radius.circular(9)),
                        image: DecorationImage(
                            image: AssetImage(background_Favorites),
                            fit: BoxFit.fill)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: black.withOpacity(0.5),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isFavorite = !_isFavorite;
                                    });
                                    _controller
                                        .reverse()
                                        .then((value) => _controller.forward());
                                  },
                                  child: ScaleTransition(
                                      scale: Tween(begin: 0.7, end: 1.0).animate(
                                          CurvedAnimation(
                                              parent: _controller,
                                              curve: Curves.easeOut)),
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            favorite_icon,
                                            color: _isFavorite ? red : white,
                                          ))),
                                )))
                      ],
                    ),
                  ),
                  SizedBox(height: h * 0.0125),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04155),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        custom_text(
                            text: lorem_ipsum_text,
                            style: CustomStyle().style_17_medium(white)),
                        SizedBox(height: h * 0.01),
                        custom_text(
                            text: favorite_lorem_text,
                            style: CustomStyle().style_14_reguler(white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            custom_text(
                                text: favorites_2_sub_text,
                                style: CustomStyle().style_12_reguler(white)),
                            TextButton(
                              onPressed: () {},
                              child: custom_text(
                                  text: see_full_story,
                                  style: CustomStyle().style_14_medium(blue)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
