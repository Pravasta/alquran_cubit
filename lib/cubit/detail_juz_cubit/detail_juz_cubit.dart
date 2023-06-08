import 'package:alquran_new/models/juz/juz_model.dart';
import 'package:alquran_new/services/detail_juz_services/detail_juz_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_juz_state.dart';

class DetailJuzCubit extends Cubit<DetailJuzState> {
  DetailJuzCubit() : super(DetailJuzInitial());

  void getDetailJuz(int noJuz) async {
    try {
      emit(DetailJuzLoading());
      final juz = await DetailJuzService().getDetailJuz(noJuz);
      emit(DetailJuzSuccess(juz));
    } catch (e) {
      emit(
        DetailJuzFailed(
          e.toString(),
        ),
      );
    }
  }
}
