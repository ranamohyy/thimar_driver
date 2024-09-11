import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';



part  'events.dart';
part 'states.dart';
part '../../../models/suggestions_model.dart';
class SuggestionsBloc extends Bloc<SuggestionsEvents,SuggestionsStates> {
  SuggestionsBloc() :super(SuggestionsInitialState()) {
    on <SuggestionsEvent>(_getData);
  }

  Future<void>_getData (SuggestionsEvent event,Emitter<SuggestionsStates>emit)async
  {
emit(SuggestionsLoadingState());
    final response = await DioHelper.send('contact',data: {
'fullname':event.nameController.text,
      'phone':event.phoneController.text,
      'title':"test",
      'content':event.contentController.text
    });

    if(response.isSuccess){
      emit(SuggestionsSuccessState(msg: response.msg));
    }
    else{
      SuggestionsFailureState(
          errMessage: response.msg
      );
    }
  }}