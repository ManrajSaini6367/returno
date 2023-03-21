// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:returno/utills/text_styles.dart';
import '../constants/colors_constant.dart';


custom_list_tile(BuildContext context, Function()? onTap,
  Widget? leading, String text) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
  return ListTile(
    onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: h*0.00375),
      // dense: true,
      leading: leading,
      minLeadingWidth: 10,
      horizontalTitleGap: 8,
      trailing: Icon(Icons.arrow_forward_ios_sharp, color: white, size: 18),
      title: custom_text(
          text: text, style: CustomStyle().style_15_reguler(white)));
}
