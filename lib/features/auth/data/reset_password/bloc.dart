import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';

part  'events.dart';
part 'states.dart';
class ResetPasswordBloc extends Bloc<ResetPasswordEvents,ResetPasswordStates> {
  ResetPasswordBloc() :super(ResetPasswordStates()){
    on<ResetPasswordEvent>(_sendData);
}

Future<void>_sendData (ResetPasswordEvent event,Emitter<ResetPasswordStates>emit)async{
    
    emit(ResetPasswordLoadingState());
    final response = await DioHelper.send("reset_password",data:{
    "phone":event.phone,
      "password":event.password,


    });
    if (response.isSuccess){
      emit(ResetPasswordSuccessState(msg: response.msg));

    }else {emit (ResetPasswordFailureState(errMessage: response.msg));}
}
}