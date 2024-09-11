import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';


part  'events.dart';
part 'states.dart';
part '../../../models/sheet_contact_us_model.dart';
class SendContactUsBloc extends Bloc<SendContactUsEvents,SendContactUsStates> {
  SendContactUsBloc (): super(SendContactUsStates()){
    on<SendContactUsEvent>(_getData);

  }
  Future <void> _getData (SendContactUsEvent event, Emitter<SendContactUsStates> emit)async
  {

    emit (SendContactUsLoadingState());
    final response = await DioHelper.send("contact",data: {
      'fullname':event.nameController.text,
      'phone':event.phoneController.text,
      'title':"test",
      'content':event.contentController.text
    }
    );

    if (response.isSuccess){
      emit (SendContactUsSuccessState(

          msg: response.msg
      ));
    }
    else{
      emit(SendContactUsFailureState(errMessage: response.msg));
    }

  }




}