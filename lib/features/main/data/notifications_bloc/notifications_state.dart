part of 'notifications_bloc.dart';

 class NotificationsStates {}

 class AllNotificationsInitial extends NotificationsStates{}
 class AllNotificationsLoading extends NotificationsStates{}
 class AllNotificationsSuccess extends NotificationsStates{
  final NotificationsModel model;
  AllNotificationsSuccess({required this.model});
 }
 class AllNotificationsFailure extends NotificationsStates{

  final String msg;
  AllNotificationsFailure({required this.msg});
 }
