import 'dart:io';

import 'package:driver/core/cache_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';
part  'events.dart';
part 'states.dart';
class ConfirmCodeBloc extends Bloc<ConfirmationCodeEvents,ConfirmCodeStates>{
  ConfirmCodeBloc():super(ConfirmCodeStates()){
    on<SendCodeEvent>(_sendData);
}


Future<void>_sendData (SendCodeEvent event,Emitter<ConfirmCodeStates>emit)async{
    
    emit(ConfirmCodeLoadingState());
    String token = await FirebaseMessaging.instance.getToken()??"test";
    final response =await DioHelper.send(
        event.type == 'driver_register'? "verify":'check_code',
    data: {
      "phone":event.PhoneNumber,
      "code":event.registerCode,
      "device_token": token,
        "type":Platform.operatingSystem,
    });    print(event.type);



    if(response.isSuccess){
   if(event.type == 'register')   {
        CacheHelper.userId = response.data['data']['id'];
        CacheHelper.image = response.data['data']['image'];
        CacheHelper.token = response.data['data']['token'];
        CacheHelper.phoneNumber = response.data['data']['phone'];
        CacheHelper.userName = response.data['data']['fullname'];

        CacheHelper.saveData();
      }
     emit(ConfirmCodeSuccessState(msg: response.msg));
    }
    else{
      emit (ConfirmCodeFailureState(errMessage: response.msg));
    }
    
}



}