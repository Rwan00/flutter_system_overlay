import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_system_overlay/home/data/constants/app_constants.dart';
import 'package:flutter_system_overlay/home/data/cubits/home_cubit.dart';
import 'package:flutter_system_overlay/home/features/widgets/time_widget.dart';

import '../../data/cubits/home_state.dart';

class TimeRowWidget extends StatelessWidget {
  const TimeRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            height: 32,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: timeModel.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 32,
                  child: GestureDetector(
                    onTap: () {
                      cubit.selectTime(index);
                    },
                    child: TimeWidget(
                      title: timeModel[index]["title"],
                      isTapped: cubit.selectedIndex == index ? true : false,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
