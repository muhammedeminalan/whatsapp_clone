part of 'situations_bloc.dart';

sealed class SituationsState extends Equatable {
  const SituationsState();

  @override
  List<Object> get props => [];
}

final class SituationsInitial extends SituationsState {}
