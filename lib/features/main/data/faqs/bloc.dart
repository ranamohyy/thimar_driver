import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dio_helper.dart';
import '../../../models/faqs_model.dart';

part  'events.dart';
part 'states.dart';

class FaqsBloc extends Bloc<FaqsEvents,FaqsStates> {
  FaqsBloc (): super(FaqsStates()){
    on<LoadFaqsEvent>(_getData);

  }
   Future <void> _getData (LoadFaqsEvent event, Emitter<FaqsStates> emit)async
   {

     emit (FaqLoadingState());
     final response = await DioHelper.get("faqs",);

     if (response.isSuccess){
      final list = List<FaqsModel>.from((response.data?['data']??[]).map((e)=>FaqsModel.fromJson(e)));
      emit (FaqSuccessState(
        list: list,
        msg: response.msg
      ));
     }
     else{
       emit(FaqFailedState(errMessage: response.msg));
     }

   }




}