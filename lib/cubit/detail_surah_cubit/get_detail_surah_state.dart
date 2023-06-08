part of 'get_detail_surah_cubit.dart';

abstract class GetDetailSurahState extends Equatable {
  const GetDetailSurahState();

  @override
  List<Object> get props => [];
}

class GetDetailSurahInitial extends GetDetailSurahState {}

class GetDetailSurahLoading extends GetDetailSurahState {}

class GetDetailSurahSucces extends GetDetailSurahState {
  final DetailSurah detailSurah;

  const GetDetailSurahSucces(this.detailSurah);

  @override
  List<Object> get props => [detailSurah];
}

class GetDetailSurahFailed extends GetDetailSurahState {
  final String error;

  const GetDetailSurahFailed(this.error);

  @override
  List<Object> get props => [error];
}
