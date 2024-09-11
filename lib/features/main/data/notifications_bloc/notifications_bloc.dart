import 'package:driver/core/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/notifications_model.dart';
part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvents, NotificationsStates> {
  NotificationsBloc() : super(NotificationsStates()) {
    on<NotificationsEvent>(_getData) ;
  }
  
  Future<void>_getData (NotificationsEvent event,Emitter<NotificationsStates>emit)async{
    emit(AllNotificationsLoading());
    final response=await DioHelper.get("notifications");
    if(response.isSuccess){
      final model = NotificationsModel.fromJson(response.data??{});

      emit(AllNotificationsSuccess(
        model: model
      ));
    }
    else{
      emit(AllNotificationsFailure(msg: response.msg));
    }
    
    
    
  }
  
}
