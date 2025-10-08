import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/config/init/injection_container.dart';
import 'package:whatsapp_clone/features/auth_features/login/domain/usecase/sign_in_usecase.dart';
import 'package:whatsapp_clone/core/utils/extensions/log_extensions.dart';
import 'package:whatsapp_clone/core/service/cache/shared_prefs_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUsecase _signIn;

  LoginBloc({SignInUsecase? signInUsecase})
    : _signIn = signInUsecase ?? sl<SignInUsecase>(),
      super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await _signIn(event.email, event.password);
      // Persist oturum durumu Firebase current user üzerinden devam edebilir, ancak eski sürüme dönüldü
      final prefs = sl<SharedPrefsService>();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', event.email);
      'GİRİŞ_BAŞARILI email=${event.email} zaman=${DateTime.now().toIso8601String()}'
          .infoLog(name: 'AUTH');
      emit(LoginSuccess());
    } catch (e) {
      'GİRİŞ_BAŞARISIZ email=${event.email} hata=${e.toString()} zaman=${DateTime.now().toIso8601String()}'
          .errorLog(name: 'AUTH');
      emit(LoginFailure(e.toString()));
    }
  }
}
