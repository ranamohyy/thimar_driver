import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';
import '../../../models/get_contact_model.dart';
part 'get_contact_event.dart';
part 'get_contact_state.dart';
class GetContactBloc extends Bloc<GetContactEvents, GetContactStates> {
  GetContactBloc() : super(GetContactInitial()) {
    on<GetContactEvent>(_getData ) ;}
    Future <void> _getData (GetContactEvent event, Emitter<GetContactStates> emit)async
    {
      emit (GetContactLoading());
      final response = await DioHelper.get("contact");

      if (response.isSuccess){
        final list = ContactUsModel.fromJson(response.data??{});
        emit (GetContactSuccess(
            list: list,
            msg: response.msg
        ));
      }
      else{
        emit(GetContactFailure(errMessage: response.msg));
      }
    }
  }

