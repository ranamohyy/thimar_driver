part of 'orders_bloc.dart';

 class OrdersStates {}

final class OrderCurrentInitial extends OrdersStates {}
final class OrderCurrentLoading extends OrdersStates {}
final class OrderCurrentSuccess extends OrdersStates {
  final List<OrderModel> model;
  final String msg;
  OrderCurrentSuccess({required this.msg,required this.model});
}
final class OrderCurrentFailure extends OrdersStates {
  final String errMessage;
  OrderCurrentFailure({required this.errMessage});
}



final class OrderEndingInitial extends OrdersStates {}
final class OrderEndingLoading extends OrdersStates {}
final class OrderEndingSuccess extends OrdersStates {
  final List<OrderModel> model;
  final String msg;
  OrderEndingSuccess({required this.msg,required this.model});
}
final class OrderEndingFailure extends OrdersStates {
  final String errMessage;
  OrderEndingFailure({required this.errMessage});
}
