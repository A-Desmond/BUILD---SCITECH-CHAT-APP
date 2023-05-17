

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/remote_data_source/remote_data_source.dart';
import 'package:equatable/equatable.dart';
part 'chat_state.dart';



class ChatCubit extends Cubit<ChatState>{
  final RemoteDataSource remoteDataSource = RemoteDataSource();
  ChatCubit() :super(ChatInitial());
  
   void sendMessage(String text)async{
       final result = await remoteDataSource.sendMessage(text:text);
      result.fold((l) => emit(ChatFailed(l.error)), (r) => null);
 } 

 Stream<List<Message>>  getChat()=>remoteDataSource.getChat();

  
}
 