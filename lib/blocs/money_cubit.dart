import 'package:flutter_bloc/flutter_bloc.dart';

class MoneyCubit extends Cubit<int> {
  MoneyCubit() : super(0);

  void addMoney(int money) {
    int currentMoney = state;
    int updatedMoney = currentMoney + money;
    emit(updatedMoney);
  }
}
