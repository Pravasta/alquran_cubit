import 'package:alquran_new/models/surah/surah_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../services/surah_services/get_api_quran_services.dart';

part 'get_api_quran_state.dart';

class GetApiQuranCubit extends Cubit<GetApiQuranState> {
  GetApiQuranCubit() : super(GetApiQuranInitial());

  void getAllSurah() async {
    try {
      emit(
        GetApiQuranLoading(),
      );
      final surah = await GetApiQuranServices().getAllSurah();
      emit(
        GetApiQuranSucces(surah),
      );
    } catch (e) {
      emit(
        GetApiQuranFailed(
          e.toString(),
        ),
      );
    }
  }
}
