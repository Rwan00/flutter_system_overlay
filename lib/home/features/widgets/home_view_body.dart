import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_system_overlay/home/data/constants/home_colors.dart';

import 'package:flutter_system_overlay/home/data/cubits/home_cubit.dart';
import 'package:flutter_system_overlay/home/data/cubits/home_state.dart';
import 'package:flutter_system_overlay/home/data/functions/snack_bar_function.dart';
import 'package:flutter_system_overlay/home/features/widgets/app_button.dart';
import 'package:flutter_system_overlay/home/features/widgets/time_row_widget.dart';
import 'package:flutter_system_overlay/home/data/constants/home_fonts.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Timer? _overlayTimer;

  @override
  void dispose() {
    _overlayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is LoadingState) {
          buildSnackBar(
            context: context,
            text: "سيتم تذكيرك كل ${HomeCubit.get(context).selectedTime}",
            clr: MyColors.kPrimaryColor,
          );
        }
       
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
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
                  cubit.showOverlayPeriodically(_overlayTimer, context);
                },
                label: "ذكرني",
              ),
            ],
          ),
        );
      },
    );
  }
}
