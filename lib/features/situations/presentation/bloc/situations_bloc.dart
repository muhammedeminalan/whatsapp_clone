import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'situations_event.dart';
part 'situations_state.dart';

class SituationsBloc extends Bloc<SituationsEvent, SituationsState> {
  SituationsBloc() : super(SituationsInitial()) {
    on<SituationsEvent>((event, emit) {});
  }
}
