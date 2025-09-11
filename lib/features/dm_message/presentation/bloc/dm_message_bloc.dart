import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dm_message_event.dart';
part 'dm_message_state.dart';

class DmMessageBloc extends Bloc<DmMessageEvent, DmMessageState> {
  DmMessageBloc() : super(DmMessageInitial()) {
    on<DmMessageEvent>((event, emit) {});
  }
}
