
import 'package:driver/core/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/orderModel.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageEvent>(_getData);
  }

  Future<void> _getData(HomePageEvent event,
      Emitter<HomePageStates>emit) async {
    emit(HomePageLoading());
    final response = await DioHelper.get('driver/pending_orders');
    if (response.isSuccess) {
      final model = List<OrderModel>.from(
          (response.data?['data'] ?? []).map((e) => OrderModel.fromJson(e)));
      emit(HomePageSuccess(model: model));
    }
    else {
      emit(HomePageFailure(errMessage: response.msg));
    }
  }
}




