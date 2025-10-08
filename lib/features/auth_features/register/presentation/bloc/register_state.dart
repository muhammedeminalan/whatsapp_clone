part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure(this.message);

  @override
  List<Object> get props => [message];
}
