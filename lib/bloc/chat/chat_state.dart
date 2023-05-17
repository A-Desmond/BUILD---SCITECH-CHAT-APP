part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
  
  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatList extends ChatState {
  final Stream<List<Message>> message;
  const ChatList(this.message);

  @override
  List<Object> get props => [message];
}

class ChatFailed extends ChatState {
  final String error;
  const ChatFailed(this.error);

  @override
  List<Object> get props => [error];
}

