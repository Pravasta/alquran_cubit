import 'package:alquran_new/models/niat_dan_doa_solat/niat_solat_model.dart';
import 'package:alquran_new/services/niat_dan_doa_services/niat_solat_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'niat_solat_state.dart';

class NiatSolatCubit extends Cubit<NiatSolatState> {
  NiatSolatCubit() : super(NiatSolatInitial());

  void getNiatSolat() async {
    try {
      emit(NiatSolatLoading());
      final niatSolat = await NiatSolatService().listNiatSolat();
      emit(NiatSolatSuccess(niatSolat));
    } catch (e) {
      emit(
        NiatSolatFailed(
          e.toString(),
        ),
      );
    }
  }
}
