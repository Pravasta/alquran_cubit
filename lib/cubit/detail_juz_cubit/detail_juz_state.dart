part of 'detail_juz_cubit.dart';

abstract class DetailJuzState extends Equatable {
  const DetailJuzState();

  @override
  List<Object> get props => [];
}

class DetailJuzInitial extends DetailJuzState {}

class DetailJuzLoading extends DetailJuzState {}

class DetailJuzSuccess extends DetailJuzState {
  final Juz juz;

  const DetailJuzSuccess(this.juz);

  @override
  List<Object> get props => [juz];
}

class DetailJuzFailed extends DetailJuzState {
  final String message;

  const DetailJuzFailed(this.message);

  @override
  List<Object> get props => [message];
}
