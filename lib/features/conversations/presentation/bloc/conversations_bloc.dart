import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'conversations_event.dart';
part 'conversations_state.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  ConversationsBloc() : super(ConversationsInitial()) {
    on<ConversationsEvent>((event, emit) {});
  }
}
