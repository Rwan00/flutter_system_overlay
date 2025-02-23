import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:flutter_system_overlay/home/features/widgets/app_button.dart';

import '../../data/constants/home_fonts.dart';

class ReminderOverlay extends StatelessWidget {
  const ReminderOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          constraints: const BoxConstraints(
            maxWidth: 300, 
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, 
            children: [
              Text(
                "استغفر الله العظيم واتوب اليه",
                style: MyFonts.titleStyle,
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  onPressed: () async {
                    await FlutterOverlayWindow.closeOverlay();
                  },
                  label: 'اغلاق',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
