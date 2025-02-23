import 'package:flutter/material.dart';
import 'package:flutter_system_overlay/home/data/constants/home_fonts.dart';

SnackBar buildSnackBar(
    {required BuildContext context, required String text, required Color clr}) {
  final snackBar = SnackBar(
    //padding: const EdgeInsets.all(0.0),
    //margin: const EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    backgroundColor: clr,
    content: Text(
      text,
      style: MyFonts.subTiltleStyle14,
    ),
    action: SnackBarAction(
      label: '',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return snackBar;
}