
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/cache_helper.dart';
import '../../../../core/dio_helper.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';
bool isSuccess= true;
class LogInBloc extends Bloc<LogInEvents, LogInStates> {
  LogInBloc() : super(LogInStates()) {
    on<LogInEvent>(_sendData);
  }
    Future<void> _sendData(LogInEvent event, Emitter<LogInStates>emit ,) async{
    emit(LogInLoadingState());
   String token = await FirebaseMessaging.instance.getToken()??"test";
    final response = await DioHelper.send('login',data:{
    'phone': "${event.code}${event.phone.text}",
    'password' : event.password.text,
    "user_type":"client",
    "device_token": token,
    "type":Platform.operatingSystem,
'city_name':event.city
    });

    if(response.isSuccess){
      CacheHelper.userId = response.data['data']['id'];
    CacheHelper.image= response.data['data']['image'];
    CacheHelper.token= response.data['data']['token'];
    CacheHelper.phoneNumber= response.data['data']['phone'];
    CacheHelper.userName= response.data['data']['fullname'];

    CacheHelper.saveData();
    emit(LogInSucessState(msg: response.msg));}
    else {
      emit (LogInFailedState(msg:response.msg));
    }

  }



}
