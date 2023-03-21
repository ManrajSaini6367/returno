// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:returno/navigation_services/navigator_key.dart';

   push_to( BuildContext context, Widget name) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => name));
  }

   replaceRoute( BuildContext context,Widget name) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => name));
  }

   pushAndRevoveUntil( BuildContext context,Widget name) {
    Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: ((context) => name)), (route) => false);
  
}
