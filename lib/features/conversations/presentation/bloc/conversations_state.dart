part of 'conversations_bloc.dart';

sealed class ConversationsState extends Equatable {
  const ConversationsState();
  
  @override
  List<Object> get props => [];
}

final class ConversationsInitial extends ConversationsState {}
