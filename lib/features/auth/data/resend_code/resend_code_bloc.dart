import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';
part 'resend_code_event.dart';
part 'resend_code_state.dart';
class ResendCodeBloc extends Bloc<ResendCodeEvents, ResendCodeStates> {
  ResendCodeBloc() : super(ResendCodeStates()) {
    on<ResendCodeEvent>(_sendData);
  }

  Future<void>_sendData(ResendCodeEvent event,Emitter<ResendCodeStates>emit)async{
    emit(ResendCodeLoadingState());
    final response =await DioHelper.send(
        event.type=='driver_register'? "resend_code" :'forget_password',
        data:{
      "phone":event.phoneNumber.text,


    } );
    if(response.isSuccess){
      emit(ResendCodeSuccessState(msg: response.msg)) ;
    }
    else{
      emit(ResendCodeFailureState(errMessage: response.msg)
      );
    }



  }
}
