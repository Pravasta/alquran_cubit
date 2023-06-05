part of 'get_api_quran_cubit.dart';

abstract class GetApiQuranState extends Equatable {
  const GetApiQuranState();

  @override
  List<Object> get props => [];
}

class GetApiQuranInitial extends GetApiQuranState {}

class GetApiQuranLoading extends GetApiQuranState {}

class GetApiQuranSucces extends GetApiQuranState {
  final List<Surah> surah;

  const GetApiQuranSucces(this.surah);

  @override
  List<Object> get props => [surah];
}

class GetApiQuranFailed extends GetApiQuranState {
  final String error;

  const GetApiQuranFailed(this.error);

  @override
  List<Object> get props => [error];
}
