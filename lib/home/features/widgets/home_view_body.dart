import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:flutter_system_overlay/home/data/constants/fuctions.dart';
import 'package:flutter_system_overlay/home/features/widgets/app_button.dart';
import 'package:flutter_system_overlay/home/features/widgets/time_row_widget.dart';
import 'package:flutter_system_overlay/home/data/constants/home_fonts.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool? status;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      status = await FlutterOverlayWindow.isPermissionGranted();
      log("Is Permission Granted: $status");
    });
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
            onPressed: () {
              if (!status!) {
                buildDialog(
                  context: context,
                  title: "Overlay Permission Needed",
                  onPressed: () async {
                    await FlutterOverlayWindow.requestPermission();
                  },
                  btnTxt: "Grant Permission",
                );
              }
            },
            label: "ذكرني",
          ),
        ],
      ),
    );
  }
}
