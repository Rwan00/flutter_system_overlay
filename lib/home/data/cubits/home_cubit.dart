import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

import '../constants/app_constants.dart';

import '../functions/dialog_function.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  String selectedTime = timeModel[0]["title"];
  Duration selectedDuration = timeModel[0]["time"];
  int selectedIndex = 0;

  void selectTime(int index) {
    selectedIndex = index;
    selectedTime = timeModel[index]["title"];
    selectedDuration = timeModel[index]["time"];
    emit(SelectIndexState());
  }

  Future<void> showOverlayPeriodically(
      Timer? overlayTimer, BuildContext context) async {
    if (!await FlutterOverlayWindow.isPermissionGranted()) {
      buildDialog(
        context: context,
        title: "Overlay Permission Needed",
        onPressed: () async {
          await FlutterOverlayWindow.requestPermission();
        },
        btnTxt: "Grant Permission",
      );
      return;
    }

    overlayTimer?.cancel();
     emit(LoadingState());
    overlayTimer = Timer.periodic(selectedDuration, (timer) async {
      if (!await FlutterOverlayWindow.isActive()) {
       
        try {
          await FlutterOverlayWindow.showOverlay(
            enableDrag: true,
            overlayTitle: "ذكرني",
            overlayContent: "استغفر الله العظيم واتوب اليه",
            flag: OverlayFlag.defaultFlag,
            visibility: NotificationVisibility.visibilityPublic,
            positionGravity: PositionGravity.auto,
            width: WindowSize.matchParent,
            startPosition: const OverlayPosition(0, -259),
          );
          emit(SuccessState());
        } catch (e) {
          log(e.toString());
          emit(ErrorState());
        }
      }
    });
  }
}
