import 'package:alquran_new/models/detail_surah_model.dart';
import 'package:alquran_new/services/detail_surah/get_detail_surah_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_detail_surah_state.dart';

class GetDetailSurahCubit extends Cubit<GetDetailSurahState> {
  GetDetailSurahCubit() : super(GetDetailSurahInitial());

  void getDetailSurah(int noSurah) async {
    try {
      emit(GetDetailSurahLoading());
      final detailSurah =
          await GetDetailSurahApiService().getDetailSurah(noSurah);
      emit(GetDetailSurahSucces(detailSurah));
    } catch (e) {
      emit(
        GetDetailSurahFailed(
          e.toString(),
        ),
      );
    }
  }
}
