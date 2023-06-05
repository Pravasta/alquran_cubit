part of 'juz_cubit.dart';

abstract class JuzState extends Equatable {
  const JuzState();

  @override
  List<Object> get props => [];
}

class JuzInitial extends JuzState {}

class JuzLoading extends JuzState {}

class JuzzSuccess extends JuzState {
  final List<Juz> juz;

  const JuzzSuccess(this.juz);

  @override
  List<Object> get props => [juz];
}

class JuzFailed extends JuzState {
  final String message;

  const JuzFailed(this.message);

  @override
  List<Object> get props => [message];
}
