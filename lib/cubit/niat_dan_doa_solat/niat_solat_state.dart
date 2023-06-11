part of 'niat_solat_cubit.dart';

abstract class NiatSolatState extends Equatable {
  const NiatSolatState();

  @override
  List<Object> get props => [];
}

class NiatSolatInitial extends NiatSolatState {}

class NiatSolatLoading extends NiatSolatState {}

class NiatSolatSuccess extends NiatSolatState {
  final List<NiatSolat> niatSolat;

  const NiatSolatSuccess(this.niatSolat);

  @override
  List<Object> get props => [niatSolat];
}

class NiatSolatFailed extends NiatSolatState {
  final String error;

  const NiatSolatFailed(this.error);

  @override
  List<Object> get props => [error];
}
