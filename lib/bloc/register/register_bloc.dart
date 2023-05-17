import 'package:bloc/bloc.dart';
import 'package:chat_app/remote_data_source/remote_data_source.dart';
import 'package:equatable/equatable.dart';

import '../../core/enum.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RemoteDataSource remoteDataSource;
  RegisterBloc({required this.remoteDataSource}) : super(RegisterInitial()) {
    on<RegisterUserEvent>(register);
    on<CheckAuthEvent>(authChecker);
  }

  void register(RegisterUserEvent event, Emitter emit) async {
    emit(RegisterLoading);
    final result = await remoteDataSource.register(name: event.name);
    result.fold(
        (l) => emit(RegisterFailure(l.error)), (r) => emit(RegisterSuccess()));
  }

 void authChecker(CheckAuthEvent event,  Emitter emit)async{
    final token = await remoteDataSource.authCheck();
    if(token!.isNotEmpty){
      emit(AuthState(AuthEnum.authenticated));
    }else{
       emit(AuthState(AuthEnum.unAuthenticated));
    }
 }


}
