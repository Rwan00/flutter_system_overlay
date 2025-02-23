import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  String? selectedTime;
  int selectedIndex = 0;

  void selectTime(int index) {
    selectedIndex = index;
    selectedTime = timeModel[index]["title"];
    emit(SelectIndexState());
  }
}
