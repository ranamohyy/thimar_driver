import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';


part  'events.dart';
part 'states.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvents, ForgetPasswordStates> {
  ForgetPasswordBloc() : super(ForgetPasswordStates()) {
    on<ForgetPasswordEvent>(_sendData);
  }

  Future<void>_sendData(ForgetPasswordEvent event,Emitter<ForgetPasswordStates>emit)async{
    emit(ForgetPasswordLoadingState());
    final response =await DioHelper.send("forget_password",data:{
      "phone":event.phoneNumber
    } );

    if(response.isSuccess){
      emit(ForgetPasswordSucessState(msg:response.msg)) ;
    }
    else{
      emit(ForgetPasswordFailedState(msg:response.msg)
      );
    }



  }
}
