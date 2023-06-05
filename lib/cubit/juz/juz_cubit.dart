import 'package:alquran_new/models/juz_model.dart';
import 'package:alquran_new/services/juz/juz.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'juz_state.dart';

class JuzCubit extends Cubit<JuzState> {
  JuzCubit() : super(JuzInitial());

  void getJuzQuran() async {
    try {
      emit(JuzLoading());
      List<Juz> juz = await JuzService().getJuzQuran();
      emit(JuzzSuccess(juz));
    } catch (e) {
      emit(
        JuzFailed(
          e.toString(),
        ),
      );
    }
  }
}
