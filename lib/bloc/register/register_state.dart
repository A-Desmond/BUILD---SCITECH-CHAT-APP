part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure(this.error);
  @override
  List<Object> get props => [error];
}

class RegisterSuccess extends RegisterState {}

class AuthState extends RegisterState {
  final AuthEnum authEnum;

  const AuthState(this.authEnum);
  @override
  List<Object> get props => [authEnum];
}
