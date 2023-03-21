// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, avoid_init_to_null, unused_element, deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors_constant.dart';
import '../../constants/image_constants.dart';
import '../../constants/text_constanst.dart';
import '../../utills/button.dart';
import '../../utills/custom_text_fields.dart';
import '../../utills/navigation_rougth.dart';
import '../../utills/text_styles.dart';
import '../homepage.dart';
import 'drawer_main_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var name_controller = TextEditingController();
  var last_name_controller = TextEditingController();
  var gmail_controller = TextEditingController();
  var mobile_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        pushAndRevoveUntil(context, Homepage());
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundclr,
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
                  text: profile, style: CustomStyle().style_18_medium(white))),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: w * 0.04155, right: w * 0.04155, top: h * 0.04),
            child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: CircleAvatar(
                                radius: 40,
                                child: ImageFile == null
                                    ? CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage(profile_image),
                                      )
                                    : CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            Image.file(File(ImageFile!.path))
                                                .image,
                                      )),
                          ),
                          SizedBox(width: w * 0.04),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              custom_text(
                                  text: "Manraj Saini",
                                  style: CustomStyle().style_18_medium(white)),
                              SizedBox(height: h * 0.01),
                              custom_text(
                                  text: "manrajsaini@gmail.com",
                                  style:
                                      CustomStyle().style_15_reguler(black50)),
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _openGallery(context);
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: h * 0.058, left: w * 0.156),
                          child: Image.asset(edit_icon, height: h * 0.035),
                        ),
                      )
                    ]),
                    Padding(
                      padding:
                          EdgeInsets.only(top: h * 0.025, bottom: h * 0.015),
                      child: custom_text(
                          text: first_name,
                          style: CustomStyle().style_16_medium(white)),
                    ),
                    custom_textformfield(context,
                      hintText: first_name,
                      suffixIcon: Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                      controller: name_controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: h * 0.025, bottom: h * 0.015),
                      child: custom_text(
                          text: last_name,
                          style: CustomStyle().style_16_medium(white)),
                    ),
                    custom_textformfield(context,
                      hintText: last_name,
                      suffixIcon: Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                      controller: last_name_controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter last name';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: h * 0.025, bottom: h * 0.015),
                      child: custom_text(
                          text: gmail,
                          style: CustomStyle().style_16_medium(white)),
                    ),
                    custom_textformfield(context,
                      hintText: gmail,
                      suffixIcon: Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                      controller: gmail_controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter gmail';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: h * 0.025, bottom: h * 0.015),
                      child: custom_text(
                          text: phone_number,
                          style: CustomStyle().style_16_medium(white)),
                    ),
                    custom_textformfield(context,
                      hintText: phone_number,
                      suffixIcon: Icon(
                        Icons.clear,
                        color: Colors.transparent,
                      ),
                      controller: mobile_controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter mobile number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: h * 0.05),
                    custom_button(context,
                        width: w * 1,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formkey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        },
                        children: [
                          custom_text(
                              text: submit,
                              style: CustomStyle().style_18_reguler(white))
                        ],
                        colors: [
                          buttonclr1,
                          buttonclr2
                        ])
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  PickedFile? ImageFile = null;
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      ImageFile = pickedFile!;
    });
  }
}
