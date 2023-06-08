part of 'doa_cubit_cubit.dart';

abstract class DoaCubitState extends Equatable {
  const DoaCubitState();

  @override
  List<Object> get props => [];
}

class DoaCubitInitial extends DoaCubitState {}

class DoaCubitLoading extends DoaCubitState {}

class DoaCubitSuccess extends DoaCubitState {
  final List<DoaModel> doaModel;

  const DoaCubitSuccess(this.doaModel);

  @override
  List<Object> get props => [doaModel];
}

class DoaCubitFailed extends DoaCubitState {
  final String message;

  const DoaCubitFailed(this.message);
  @override
  List<Object> get props => [message];
}
