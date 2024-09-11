import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dio_helper.dart';
import '../../../models/about_app_model.dart';

part 'about_app_event.dart';
part 'about_app_state.dart';
class AboutAppBloc extends Bloc<AboutAppEvent, AboutAppStates>
{
  AboutAppBloc() : super(AboutAppInitialState()) {
    on<AboutAppEvent>( _getData) ;
   }
   
   Future<void> _getData(AboutAppEvent event,Emitter<AboutAppStates>emit)async
   {
     emit(AboutAppLoadingState());
     final response = await DioHelper.get("about");
     if (response.isSuccess){
       final list =  AboutAppModel.fromJson(response.data ?? {});

       emit(AboutAppSuccessState(
               msg:response.msg, list:list,
       ));

     }else {
      emit( AboutAppFailedState(
         errMessege: response.msg
       ));
     }
   }
  }

