part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final String name;
  const RegisterUserEvent(this.name);

  @override
  List<Object> get props => [name];
}

class CheckAuthEvent extends RegisterEvent {
  const CheckAuthEvent();

  @override
  List<Object> get props => [];
}
