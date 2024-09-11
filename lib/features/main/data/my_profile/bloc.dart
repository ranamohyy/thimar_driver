
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:driver/core/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';

part  'events.dart';
part 'states.dart';
class MyProfileBloc extends Bloc<ProfileEvents,ProfileStates> {
  MyProfileBloc() :super(ProfileStates()) {
    on <EditProfileEvent>(_sendData );
    on <EditPasswordEvent>(_editData );
}

  Future<void>_sendData (EditProfileEvent event,Emitter<ProfileStates>emit)async
  {
    emit(EditProfileLoadingState());
    final response = await DioHelper.send('client/profile',
        data: {
        'image':MultipartFile.fromFileSync(event.image!.path),
        'fullname':event.nameController.text,
          'phone':event.phoneController.text,
          'city':event.cityController.text,
          'model_id':event.modelId,
          'identity_number':event.indentityNumber.text,
          'car_type':event.carType.text,
          'iban':event.iban.text,
          'bank_name':event.bankName.text,
          'car_licence_image':MultipartFile.fromFileSync(event.carLicenceImage!.path),
          'car_form_image':MultipartFile.fromFileSync(event.carFormImage!.path),
          'car_insurance_image':MultipartFile.fromFileSync(event.carInsuranceImage!.path),
          'car_front_image':MultipartFile.fromFileSync(event.carFrontImage!.path),
          'car_back_image':MultipartFile.fromFileSync(event.carBackImage!.path)

        });
    if (response.isSuccess) {
      CacheHelper.userId = response.data['data']['id'];
      CacheHelper.image= response.data['data']['image'];
      CacheHelper.cityName= response.data['data']['city'];
      CacheHelper.phoneNumber= response.data['data']['phone'];
      CacheHelper.userName= response.data['data']['fullname'];
      CacheHelper.identityNumber= response.data['data']['identity_number'];
      ///car
      CacheHelper.iban= response.data['data']['iban'];
      CacheHelper.backCarImage= response.data['data']['car_back_image'];
      CacheHelper.bankName= response.data['data']['bank_name'];
      CacheHelper.licenceImage= response.data['data']['car_licence_image'];
      CacheHelper.insuranceCarImage= response.data['data']['car_insurance_image'];
      CacheHelper.frontCarImage= response.data['data']['car_front_image'];
      CacheHelper.formCarImage= response.data['data']['car_form_image'];
      CacheHelper.carModelName= response.data['data']['car_model']['name'];
      CacheHelper.carModelId= response.data['data']['car_model']['id'];

      CacheHelper.saveData();

      emit(EditProfileSuccessState(msg: response.msg));
    }
    else {
      EditProfileFailureState(
          errMessage: response.msg
      );
    }
  }}

  Future<void>_editData (EditPasswordEvent event,Emitter<ProfileStates>emit)async
  {
emit((EditPasswordLoadingState()));

    final response = await DioHelper.put('edit_password',data: {
      "old_password":event.oldPasswordController.text,
      "password":event.passwordController.text,
      "password_confirmation":event.passwordConfirmationController.text
    });

    if(response.isSuccess){
      emit(EditPasswordSuccessState(msg: response.msg));
    }
    else{
      EditPasswordFailureState(
          errMessage: response.msg
      );
    }
  }