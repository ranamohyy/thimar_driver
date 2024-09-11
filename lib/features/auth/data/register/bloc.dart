import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dio_helper.dart';
part  'events.dart';
part 'states.dart';
class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(RegisterStates()){
    on<RegisterEvent>(_sendData);
  }
  Future<void> _sendData (RegisterEvent event ,Emitter<RegisterStates> emit)async{
    emit(RegisterLoadingState());
    final response = await DioHelper.send("driver_register",data:{
      "fullname": event.fullName.text,
      "phone":" ${event.code}${event.phoneNumber.text}",
      "password":event.password.text,
      "password_confirmation":event.passwordConfirmation.text,
      "city": event.city.text,
      'city_id':event.cityId,
      'lat':event.lat,
      'lng':event.lng,
      'location':event.location,
      'model_id':event.modelId,
      'identity_number':event.indentityNumber.text,
      "email":event.email.text,
      'car_type':event.carType.text,
      'iban':event.iban.text,
      'bank_name':event.bankName.text,
      'car_licence_image':MultipartFile.fromFileSync(event.carLicenceImage!.path),
      'car_form_image':MultipartFile.fromFileSync(event.carFormImage!.path),
      'car_insurance_image':MultipartFile.fromFileSync(event.carInsuranceImage!.path),
      'car_front_image':MultipartFile.fromFileSync(event.carFrontImage!.path),
      'car_back_image':MultipartFile.fromFileSync(event.carBackImage!.path)
    });
    if(response.isSuccess){
     emit(RegisterSuccessState(msg: response.msg)) ;
    }
    else{
      emit(RegisterFailureState(errMessage: response.msg)
      );
    }
  }
}