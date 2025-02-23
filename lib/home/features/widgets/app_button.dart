import 'package:flutter/material.dart';

import '../../data/constants/home_colors.dart';
import '../../data/constants/home_fonts.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            Colors.white,
          ),
          textStyle: WidgetStateProperty.all(
            MyFonts.subTiltleStyle16,
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            MyColors.kPrimaryColor,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
