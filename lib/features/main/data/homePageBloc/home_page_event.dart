part of 'home_page_bloc.dart';

 class HomePageEvents {}
 class HomePageEvent extends HomePageEvents {
   HomePageEvent();
 }
class OrderDetailsEvent extends HomePageEvents {
  final int id;
  OrderDetailsEvent({required this.id});
}