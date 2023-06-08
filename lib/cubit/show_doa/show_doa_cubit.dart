import 'package:bloc/bloc.dart';

class ShowDoaCubit extends Cubit<Map<String, bool>> {
  ShowDoaCubit() : super({});

  void showPopUp(String id) {
    final currentState = state;
    currentState[id] = true;
    emit({...currentState});
  }

  void closePopUp(String id) {
    final currentState = state;
    currentState[id] = false;
    emit({...currentState});
  }
}
