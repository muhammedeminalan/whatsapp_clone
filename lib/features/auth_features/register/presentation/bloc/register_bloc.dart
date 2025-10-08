import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/auth_features/register/domain/usecase/sing_up_usecase.dart';
import 'package:whatsapp_clone/config/init/injection_container.dart';
import 'package:whatsapp_clone/core/utils/extensions/log_extensions.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SingUpUsecase _signUp;

  RegisterBloc({SingUpUsecase? signUpUsecase})
    : _signUp = signUpUsecase ?? sl<SingUpUsecase>(),
      super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      await _signUp(event.email, event.password);
      'KAYIT_BAŞARILI email=${event.email} zaman=${DateTime.now().toIso8601String()}'
          .infoLog(name: 'AUTH');
      emit(RegisterSuccess());
    } catch (e) {
      'KAYIT_BAŞARISIZ email=${event.email} hata=${e.toString()} zaman=${DateTime.now().toIso8601String()}'
          .errorLog(name: 'AUTH');
      emit(RegisterFailure(e.toString()));
    }
  }
}
