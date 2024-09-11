part of 'home_page_bloc.dart';

 class HomePageStates {}

final class HomePageInitial extends HomePageStates {}
final class HomePageLoading extends HomePageStates {}
final class HomePageSuccess extends HomePageStates {
   final List<OrderModel> model;
   HomePageSuccess({required this.model});
}
final class HomePageFailure extends HomePageStates {
   final String errMessage;
   HomePageFailure({required this.errMessage});
}
class OrderDetailsStates {}

final class OrderDetailsInitial extends HomePageStates {}
final class OrderDetailsLoading extends HomePageStates {}
final class OrderDetailsSuccess extends HomePageStates {
  final  OrderModel model;
  final String msg;
  OrderDetailsSuccess({required this.msg,required this.model});
}
final class OrderDetailsFailure extends HomePageStates {
  final String errMessage;
  OrderDetailsFailure({required this.errMessage});
}
