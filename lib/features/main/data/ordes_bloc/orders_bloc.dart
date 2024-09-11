
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dio_helper.dart';
import '../../../models/orderModel.dart';

part 'orders_Event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  OrdersBloc() : super(OrdersStates()) {
    on<OrderCurrentEvent>(_getData) ;
    on<OrderEndingEvent>(_getFinishData);
    }

    Future<void>_getData (OrderCurrentEvent event,Emitter<OrdersStates>emit)async{
      emit(OrderCurrentLoading());
      final response= await DioHelper.get('driver/current_orders');
      if(response.isSuccess){
        final model = List<OrderModel>.from(
            (response.data?['data'] ?? []).map((e) => OrderModel.fromJson(e)));
        emit(OrderCurrentSuccess(msg: response.msg,model:model ));
      }
      else{
        emit(OrderCurrentFailure(errMessage: response.msg));
      }

    }
    Future<void>_getFinishData (OrderEndingEvent event,Emitter<OrdersStates>emit)async{
      emit(OrderEndingLoading());
      final response= await DioHelper.get('driver/finished_orders');
      if(response.isSuccess){
        final model = List<OrderModel>.from(
            (response.data?['data'] ?? []).map((e) => OrderModel.fromJson(e)));
        emit(OrderEndingSuccess(msg: response.msg,model:model ));
      }
      else{
        emit(OrderEndingFailure(errMessage: response.msg));
      }

    }
  }

