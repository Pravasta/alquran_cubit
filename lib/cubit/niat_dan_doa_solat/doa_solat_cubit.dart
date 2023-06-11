import 'package:alquran_new/models/niat_dan_doa_solat/doa_solat_model.dart';
import 'package:alquran_new/services/niat_dan_doa_services/doa_solat_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doa_solat_state.dart';

class DoaSolatCubit extends Cubit<DoaSolatState> {
  DoaSolatCubit() : super(DoaSolatInitial());

  void getListDoaSolat() async {
    try {
      emit(DoaSolatLoading());
      final doaSolat = await DoaSolatService().listDoaSolat();
      emit(DoaSolatSucces(doaSolat));
    } catch (e) {
      emit(
        DoaSolatFailed(
          e.toString(),
        ),
      );
    }
  }
}
