

// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';


custom_circleAvatar(BuildContext context, {Color? backgroundColor}) {
  var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: w * 0.01385),
    child: CircleAvatar(radius: h * 0.00625, backgroundColor: backgroundColor),
  );
}