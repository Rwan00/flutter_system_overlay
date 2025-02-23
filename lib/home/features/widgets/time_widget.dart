import 'package:flutter/material.dart';
import 'package:flutter_system_overlay/home/data/constants/home_colors.dart';
import 'package:flutter_system_overlay/home/data/constants/home_fonts.dart';

class TimeWidget extends StatefulWidget {
  final String title;
  final bool isTapped;
  const TimeWidget({
    super.key,
    required this.title,
    required this.isTapped,
  });

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 32,
        width: 95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),
          color: widget.isTapped ? MyColors.kPrimaryColor : Colors.white,
        ),
        child: Center(
            child: Text(
          widget.title,
          style: widget.isTapped
              ? MyFonts.subTiltleStyle14
              : MyFonts.subTiltleStyle16,
        )),
      ),
    );
  }
}
