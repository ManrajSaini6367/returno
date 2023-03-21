// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import '../constants/image_constants.dart';


Widget custom_button(BuildContext context,
    {double? width,
    Function()? onTap,
    List<Widget>? children,
    List<Color>? colors}) {
      var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: onTap,
    child: Container(
        height: h * 0.065,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors!,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center, children: children!)),
  );
}

// arrow back button
back_icon(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Padding(
      padding: EdgeInsets.only(top: h * 0.01625, bottom: h * 0.015),
      child: Image.asset(arrow_back_icon),
    ),
  );
}
