part of 'doa_solat_cubit.dart';

abstract class DoaSolatState extends Equatable {
  const DoaSolatState();

  @override
  List<Object> get props => [];
}

class DoaSolatInitial extends DoaSolatState {}

class DoaSolatLoading extends DoaSolatState {}

class DoaSolatSucces extends DoaSolatState {
  final List<DoaSolat> doaSolat;

  const DoaSolatSucces(this.doaSolat);

  @override
  List<Object> get props => [doaSolat];
}

class DoaSolatFailed extends DoaSolatState {
  final String error;

  const DoaSolatFailed(this.error);

  @override
  List<Object> get props => [error];
}
