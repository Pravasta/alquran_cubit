import 'package:alquran_new/models/doa/doa_model.dart';
import 'package:alquran_new/services/doa_services/doa_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doa_cubit_state.dart';

class DoaCubitCubit extends Cubit<DoaCubitState> {
  DoaCubitCubit() : super(DoaCubitInitial());

  void getListDoa() async {
    try {
      emit(DoaCubitLoading());
      final doa = await DoaService().listDoaServices();
      emit(
        DoaCubitSuccess(doa),
      );
    } catch (e) {
      emit(
        DoaCubitFailed(
          e.toString(),
        ),
      );
    }
  }
}
