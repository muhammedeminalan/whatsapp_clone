part of 'dm_message_bloc.dart';

sealed class DmMessageState extends Equatable {
  const DmMessageState();

  @override
  List<Object> get props => [];
}

final class DmMessageInitial extends DmMessageState {}
