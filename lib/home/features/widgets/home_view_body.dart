import 'package:flutter/material.dart';
import 'package:flutter_system_overlay/home/features/widgets/app_button.dart';
import 'package:flutter_system_overlay/home/features/widgets/time_row_widget.dart';
import 'package:flutter_system_overlay/home/data/constants/home_fonts.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "استغفر الله العظيم واتوب اليه",
              style: MyFonts.titleStyle,
            ),
            TimeRowWidget(),
            AppButton(
              onPressed: () {},
              label: "ذكرني",
            ),
          ],
        ),
    );
  }
}