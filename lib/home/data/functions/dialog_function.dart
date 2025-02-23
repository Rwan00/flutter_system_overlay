import 'package:flutter/material.dart';
import 'package:flutter_system_overlay/home/data/constants/home_colors.dart';
import 'package:flutter_system_overlay/home/data/constants/home_fonts.dart';

void buildDialog({
  required BuildContext context,
  required String title,
  required void Function() onPressed,
  required String btnTxt,
}) {
  double height = MediaQuery.of(context).size.height;
  final AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    contentTextStyle: MyFonts.subTiltleStyle14,
    title: Text(
      title,
      style: MyFonts.titleStyle,
    ),
    content: SizedBox(
      height: height * 0.13,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Divider(
            color: Colors.grey,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  const WidgetStatePropertyAll(MyColors.kPrimaryColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              btnTxt,
              style: MyFonts.subTiltleStyle14,
            ),
          ),
         
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Cancel",
              style: MyFonts.subTiltleStyle14,
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return alert;
    },
    barrierDismissible: false,
    //barrierColor: Colors.orange.withOpacity(0.3)
  );
}
